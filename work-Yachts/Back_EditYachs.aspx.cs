using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace work_Yachts.Back
{
    public partial class Back_EditYachs : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DDYachtmodel.DataBind();

            }
        }

        protected void BtnEditYacht_Click(object sender, EventArgs e)
        {
            DateTime nowTime = DateTime.Now;
            string guidStr = $"{Guid.NewGuid():N}{nowTime:ff}";
            string isNewDesign = CBoxNewDesign.Checked ? "True" : "False";
            string isNewBuilding = CBoxNewBuilding.Checked ? "True" : "False";

            string dimensionsImgPath = SaveFile(odImgPathImgpath1, "DimensionsImages");
            string downloadsFilePath = SaveFile(Editfile, "Downloads");

            // 上傳大量圖片
            List<FileUpload> fileUploads = new List<FileUpload> { uplayout };

            List<string> imagePaths = new List<string>();
            foreach (var fileUpload in fileUploads)
            {
                if (fileUpload.HasFiles)
                {
                    foreach (var file in fileUpload.PostedFiles)
                    {
                        string filename = Path.GetFileName(file.FileName);
                        string filePath1 = Server.MapPath("~/upload/yachts/" + filename);
                        file.SaveAs(filePath1);
                        imagePaths.Add(filePath1);
                    }
                }
            }

            // 將圖片路徑以 HTML 格式插入資料庫
            string imagesHtml = GenerateImageHTML(imagePaths);

            // 上傳大量圖片
            List<ImagePath> savePathList = SaveFiles(upbannerpic, "bannerImgPathJSON");
            string savePathJsonStr = JsonConvert.SerializeObject(savePathList);

            // 更新資料庫
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("UPDATE Yachts SET yachtModel = @yachtModelStr, isNewDesign = @isNewDesign, isNewBuilding = @isNewBuilding, guid = @guidStr, " +
                                                   "overviewContentHtml = COALESCE(@overviewContentHtml, overviewContentHtml), " +
                                                   "overviewDimensionsImgPath = CASE WHEN @newDimensionsImgPath IS NOT NULL THEN @newDimensionsImgPath ELSE overviewDimensionsImgPath END, " +
                                                   "overviewDownloadstitle = CASE WHEN @newDownloadsFilePath IS NOT NULL THEN @newDownloadsFilePath ELSE overviewDownloadstitle END, " +
                                                   "overviewDimensionsJSON = COALESCE(@overviewDimensionsJSON, overviewDimensionsJSON), " +
                                                   "layoutDeckPlanImgPathJSON = COALESCE(@layoutDeckPlanImgPathJSON, layoutDeckPlanImgPathJSON), " +
                                                   "youtubeUrl = COALESCE(@youtubeUrl, youtubeUrl) " +
                                                   "WHERE id = @id", connection);

                string selyachtModel = DDYachtmodel.SelectedValue;
                command.Parameters.AddWithValue("@id", selyachtModel);
                command.Parameters.AddWithValue("@yachtModelStr", TxtedYachtModel.Text);
                command.Parameters.AddWithValue("@isNewDesign", isNewDesign);
                command.Parameters.AddWithValue("@isNewBuilding", isNewBuilding);
                command.Parameters.AddWithValue("@guidStr", guidStr);
                command.Parameters.AddWithValue("@overviewContentHtml", CKEdOcHtml.Text);

                // 只有在 newDimensionsImgPath 有值時才新增參數，避免更新該欄位
                if (!string.IsNullOrWhiteSpace(dimensionsImgPath))
                {
                    command.Parameters.AddWithValue("@newDimensionsImgPath", dimensionsImgPath);
                }
                else
                {
                    command.Parameters.AddWithValue("@newDimensionsImgPath", DBNull.Value);
                }

                // 只有在 newDownloadsFilePath 有值時才新增參數，避免更新該欄位
                if (!string.IsNullOrWhiteSpace(downloadsFilePath))
                {
                    command.Parameters.AddWithValue("@newDownloadsFilePath", downloadsFilePath);
                }
                else
                {
                    command.Parameters.AddWithValue("@newDownloadsFilePath", DBNull.Value);
                }

                command.Parameters.AddWithValue("@layoutDeckPlanImgPathJSON", imagesHtml);
                command.Parameters.AddWithValue("@overviewDimensionsJSON", CKEoverviewDimensionsJSON.Text);
                command.Parameters.AddWithValue("@youtubeUrl", Txtvideo.Text);

                // 只在 bannerImgPathJSON 沒有值時才新增參數，避免更新該欄位
                if (string.IsNullOrWhiteSpace(savePathJsonStr))
                {
                    command.Parameters.AddWithValue("@bannerImgPathJSON", DBNull.Value);
                }

                command.ExecuteNonQuery();
                connection.Close();
            }

            Response.Write("<script>alert('上傳成功')</script>");
            DDYachtmodel.DataBind();

        }

        private List<ImagePath> SaveFiles(FileUpload fileUpload, string folderName)
        {
            List<ImagePath> savePathList = new List<ImagePath>();

            if (fileUpload.HasFile)
            {
                HttpPostedFile postedFile = fileUpload.PostedFile;
                int fileSize = postedFile.ContentLength;

                if (fileSize < 1024 * 1000 * 10)
                {
                    string fileName = Path.GetFileName(postedFile.FileName);
                    // 只保留檔案名稱，不含路徑部分
                    string newFileName = Path.GetFileNameWithoutExtension(fileName) + Path.GetExtension(fileName);

                    savePathList.Add(new ImagePath { SavePath = newFileName });
                }
                else
                {
                    // 檔案過大的處理...
                }
            }

            return savePathList;
        }
        public class ImagePath
        {
            public string SavePath { get; set; }
        }
        private string GenerateImageHTML(List<string> imagePaths)
        { //for新聞內容上傳圖片的
            StringBuilder imagesHtml = new StringBuilder();
            //string uploadFolderPath = "~/upload/news/"; // 定義上傳資料夾的相對路徑

            foreach (string path in imagePaths)
            {
                string relativePath = path.Replace(Server.MapPath("~"), ""); // 取得相對路徑
                imagesHtml.Append("<img alt=\"\" src=\"" + relativePath + "\" style=\"width: 650px;\" />");
            }

            return imagesHtml.ToString();
        }

        private string SaveFile(FileUpload fileUploadControl, string folderName)
        {
            if (fileUploadControl.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadControl.FileName);
                string folderPath = Server.MapPath($"~/upload/yachts{folderName}/");
                string filePath = Path.Combine(folderPath, fileName);

                Directory.CreateDirectory(folderPath);
                fileUploadControl.SaveAs(filePath);

                return filePath;
            }

            return null;
        }

        
        protected void DDYachtmodel_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDealerList();
        }
        private void showDealerList()
        {
            string selyachtModel = DDYachtmodel.SelectedValue;

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            {
                string sql = "SELECT * FROM Yachts WHERE id = @id"; // 使用 yachtModel 作為條件，這可能需要調整以適應你的資料庫結構
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", selyachtModel); // 將選擇的 Headline 設置為查詢條件

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        TxtedYachtModel.Text = HttpUtility.HtmlEncode(reader["yachtModel"].ToString()); // 使用 HtmlEncode 方法對資料進行編碼
                        CBoxNewDesign.Checked = reader["isNewDesign"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase);
                        CBoxNewBuilding.Checked = reader["isNewBuilding"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase);
                        CKEdOcHtml.Text = HttpUtility.HtmlEncode(reader["overviewContentHtml"].ToString());//文章內容
                        odImgPathImgpath.Text = HttpUtility.HtmlEncode(reader["overviewDimensionsImgPath"].ToString());//文章內容裡的小圖片
                        downloadtitle.Text = HttpUtility.HtmlEncode(reader["overviewDownloadstitle"].ToString());//下載檔案標題
                        DownloadsFilespath.Text = HttpUtility.HtmlEncode(reader["overviewDownloadsFilePath"].ToString());//下載檔案
                        CKEoverviewDimensionsJSON.Text = HttpUtility.HtmlEncode(reader["overviewDimensionsJSON"].ToString());//Dimensions文+圖
                        LDPath.Text = HttpUtility.HtmlEncode(reader["layoutDeckPlanImgPathJSON"].ToString());
                        Txtvideo.Text = HttpUtility.HtmlEncode(reader["youtubeUrl"].ToString());


                    }
                }

                reader.Close();
            }
        }

        private List<string> DeserializeLayoutPaths(string json)
        {
            List<string> layoutPaths = new List<string>();
            if (!string.IsNullOrEmpty(json))
            {
                layoutPaths = JsonConvert.DeserializeObject<List<string>>(json);
            }
            return layoutPaths;
        }

        protected void deleteYacht_Click(object sender, EventArgs e)
        {
            string selyachtModel = DDYachtmodel.SelectedValue;

            // 此处不再需要确认提示，因为在 JavaScript 中已经处理
    

            string sqlDel = "DELETE FROM Yachts WHERE id = @selyachtModel";
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            SqlCommand commandDel = new SqlCommand(sqlDel, connection);
            commandDel.Parameters.AddWithValue("@selyachtModel", selyachtModel); // 此處修改為 @selyachtModel
            Response.Write("<script>alert('刪除成功')</script>");
            connection.Open();
            commandDel.ExecuteNonQuery();
            connection.Close();
           
            Response.Redirect(Request.RawUrl); 


        }
    }
    }
