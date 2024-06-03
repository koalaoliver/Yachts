using CKEditor.NET;
using CKFinder;
using MimeKit;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Org.BouncyCastle.Utilities.Collections;
using NetVips;
using System.Web.Script.Serialization;

namespace work_Yachts
{
    public partial class Back_News : System.Web.UI.Page
    {

        //宣告 List 方便用 Add 依序添加資料
        //private List<ImagePath> savePathList = new List<ImagePath>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ckfinderSetPath();
                Calendar1.SelectedDate = Calendar1.TodaysDate; //預設選取當日日期
                LoadDayNewsHeadline(); //讀取新聞標題
                showDealerList();
                DDnews.DataBind();

            }
        }





        private void LoadDayNewsHeadline()
        {
            //依選取日期取得資料庫新聞內容
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT * FROM News WHERE DateTitle = @DateTitle ORDER BY id ASC";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@DateTitle", Calendar1.SelectedDate.ToString("yyyy-M-dd"));
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string headlineStr = reader["Headline"].ToString();
                string isTopStr = reader["isTop"].ToString();

                ListItem listItem = new ListItem();
                listItem.Text = headlineStr;
                listItem.Value = headlineStr;

            }
            connection.Close();



        }


        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            //取得當月第一天跟最後一天
            DateTime firstDay = DateTime.Now.AddDays(-DateTime.Now.Day + 1);
            DateTime lastDay = DateTime.Now.AddMonths(1).AddDays(-DateTime.Now.AddMonths(1).Day);
            //取得當月第一天往前100天+當月最後一天往後100天
            string firstDayLastWeek = firstDay.AddDays(-100).ToString("yyyyMMdd");
            string lastDayNextWeek = lastDay.AddDays(100).ToString("yyyyMMdd");
            //取得新聞日期
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT DateTitle FROM News WHERE DateTitle BETWEEN @firstDayLastWeek AND @lastDayNextWeek";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@firstDayLastWeek", firstDayLastWeek);
            command.Parameters.AddWithValue("@lastDayNextWeek", lastDayNextWeek);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                //轉換為 DateTime 型別
                DateTime newsTime = DateTime.Parse(reader["DateTitle"].ToString());
                //有新聞的日期 且 此日期不是選中的日期時 就修改日期外觀
                if (e.Day.Date.Date == newsTime && e.Day.Date.Date != Calendar1.SelectedDate)
                {
                    //渲染畫面
                    //e.Cell.BorderWidth = Unit.Pixel(1); //外框線粗細
                    //e.Cell.BorderColor = Color.BlueViolet; //外框線顏色
                    e.Cell.Font.Underline = true; //有無下地線
                    e.Cell.Font.Bold = true; //是否為粗體
                    e.Cell.ForeColor = Color.DodgerBlue; //外觀色彩
                }
            }
            connection.Close();
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            LoadDayNewsHeadline();

        }

        protected void AddHeadlineBtn_Click(object sender, EventArgs e)
        {
            //產生 GUID 隨機碼 + 時間2位秒數 (加強避免重複)
            DateTime nowTime = DateTime.Now;
            string nowSec = nowTime.ToString("ff");
            string guid = Guid.NewGuid().ToString().Trim() + nowSec;
            //取得日曆選取日期
            string selNewsDate = Calendar1.SelectedDate.ToString("yyyy-M-dd");
            //取得是否勾選
            string isTop = CBoxIsTop.Checked.ToString(); //得到 "True" or "False"

            //-------------------上傳小縮圖
            List<string> imagePaths1 = new List<string>();
            string fileName = Path.GetFileName(thumbnailUpload.FileName);
            string filePath = Server.MapPath("~/upload/news/" + fileName);
            thumbnailUpload.SaveAs(filePath);
            imagePaths1.Add(filePath);  // 將上傳的檔案路徑添加到列表中
            string imagesHtmlThumbnailPath = fileName;

            List<string> imagePaths2 = new List<string>();
            foreach (HttpPostedFile postedFile in FUPic1.PostedFiles)
            {
                if (postedFile.ContentLength > 0) // 檢查是否有選擇檔案
                {
                    string filename = Path.GetFileName(postedFile.FileName);
                    string filePath2 = Server.MapPath("~/upload/news/" + filename);
                    postedFile.SaveAs(filePath2);
                    imagePaths2.Add(filePath2);
                }
            }

            // 將檔案路徑轉為 JSON 字串
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string imagesJson = imagePaths2.Count > 0 ? serializer.Serialize(imagePaths2) : string.Empty;

            //上傳CKEDIT的內容
            string aboutUsHtmlStr = HttpUtility.HtmlEncode(CKTxNews.Text);

            //將資料存入資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "INSERT INTO News (DateTitle, Headline, Guid, isTop, Summary, ThumbnailPath, NewsContentHtml, NewsImageJson) VALUES (@selNewsDate, @Headline, @Guid, @isTop, @Summary, @ThumbnailPath, @NewsContentHtml, @NewsImageJson)";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@selNewsDate", selNewsDate);
            command.Parameters.AddWithValue("@Headline",  headlineTbox.Text);
            command.Parameters.AddWithValue("@Guid", guid);
            command.Parameters.AddWithValue("@isTop", isTop); //存入資料庫會轉為 0 or 1
            command.Parameters.AddWithValue("@ThumbnailPath", imagesHtmlThumbnailPath);
            command.Parameters.AddWithValue("@Summary", summaryTbox.Text);
            command.Parameters.AddWithValue("@NewsContentHtml",  aboutUsHtmlStr);
            command.Parameters.AddWithValue("@NewsImageJson",  imagesJson);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            //渲染畫面提示
            DateTime nowtime = DateTime.Now;
            Response.Write("<script>alert('上傳成功')</script>");

            //清空輸入欄位
            headlineTbox.Text = "";
        }

        
        private void showDealerList()
        {
            string selHeadline = DDnews.SelectedValue;

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);

            string sql = "SELECT * FROM News WHERE Headline = @Headline"; // 使用 Headline 作為條件，這可能需要調整以適應你的資料庫結構
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Headline", selHeadline); // 將選擇的 Headline 設置為查詢條件

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            string isTop = EDisTOP.Checked.ToString();
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    if (reader["isTop"] != DBNull.Value)
                    {
                        bool isTopValue = (bool)reader["isTop"];

                        EDisTOP.Checked = isTopValue;
                    }
                    TxtDateTitle.Text = HttpUtility.HtmlEncode(reader["DateTitle"].ToString()); // 使用 HtmlEncode 方法對資料進行編碼
                    TxtHeadline.Text = HttpUtility.HtmlEncode(reader["Headline"].ToString());
                    TxtSummary.Text = HttpUtility.HtmlEncode(reader["Summary"].ToString());
                    ThumbnailPath.Text = HttpUtility.HtmlEncode(reader["ThumbnailPath"].ToString());
                    CKEditorNewCon.Text = HttpUtility.HtmlEncode(reader["NewsContentHtml"].ToString());
                    TxtNImg.Text = HttpUtility.HtmlEncode(reader["NewsImageJson"].ToString());
                }
            }

            reader.Close();
            connection.Close();
        }

        protected void DDnews_SelectedIndexChanged(object sender, EventArgs e)
        {
            showDealerList();
        }

        protected void EDnewsubmit_Click(object sender, EventArgs e)
        {
            string selHeadline = DDnews.SelectedValue;
            bool isTopValue = EDisTOP.Checked;

            //-------------------上傳小縮圖
            string fileName = Path.GetFileName(EDThpic.FileName);
            string filePath = Server.MapPath("~/upload/news/" + fileName);
            string imagesHtmlThumbnailPath = fileName;

            List<string> imagePaths2 = new List<string>();
            foreach (HttpPostedFile postedFile in Ed_NewsPic01.PostedFiles)
            {
                string filename = Path.GetFileName(postedFile.FileName);
                string filePath2 = Server.MapPath("~/upload/news/" + filename);
                //postedFile.SaveAs(filePath2);
                imagePaths2.Add(filePath2);
            }
            // 將檔案路徑轉為 JSON 字串
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string imageRelativePath = "~/upload/news/" + Path.GetFileName(imagePaths2[0]);
            string imagesJson = serializer.Serialize(imageRelativePath);

            //上傳CKEDIT的內容
            string aboutUsHtmlStr = HttpUtility.HtmlEncode(CKEditorNewCon.Text);

            //將資料更新到資料庫
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString))
            {
                string sql = "UPDATE News SET Headline = @Headline, isTop = @isTop, Summary = @Summary, ThumbnailPath = @ThumbnailPath, NewsContentHtml = @NewsContentHtml, NewsImageJson = @NewsImageJson WHERE Headline = @SelectedHeadline";
                SqlCommand command = new SqlCommand(sql, connection);

                command.Parameters.AddWithValue("@Headline", TxtHeadline.Text);
                command.Parameters.AddWithValue("@isTop", isTopValue);
                command.Parameters.AddWithValue("@Summary", TxtSummary.Text);
                command.Parameters.AddWithValue("@ThumbnailPath", imagesHtmlThumbnailPath);
                command.Parameters.AddWithValue("@NewsContentHtml", aboutUsHtmlStr);
                command.Parameters.AddWithValue("@NewsImageJson", imagesJson);
                command.Parameters.AddWithValue("@SelectedHeadline", selHeadline);

                connection.Open();
                command.ExecuteNonQuery();
            }

            //渲染畫面提示
            Response.Write("<script>alert('編輯成功')</script>");

            //清空輸入欄位
            TxtHeadline.Text = "";
            EDisTOP.Checked = false;
            TxtSummary.Text = "";
            ThumbnailPath.Text = "";
            CKEditorNewCon.Text = "";
            TxtNImg.Text = "";
        }



        protected void DeleteNewsBtn_Click(object sender, EventArgs e)
        {
            string selHeadline = DDnews.SelectedValue;

            string sqlDel = "DELETE FROM News WHERE Headline = @selHeadline";
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            SqlCommand commandDel = new SqlCommand(sqlDel, connection);
            commandDel.Parameters.AddWithValue("@selHeadline", selHeadline);
            connection.Open();
            commandDel.ExecuteNonQuery();
            connection.Close();
            Response.Write("<script>alert('刪除成功')</script>");
            headlineTbox.Text = "";


        }
    }

}
