using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_Yachts
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ckfinderSetPath();
                loadCkeditorContent();
                loadCertificatContent();
                loadCertificatPictureV();

              
            }
        }

        private void loadCkeditorContent()
        {   // 建立 loadCkeditorContent
            //取得 About Us 頁面 HTML 資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT AbouutUsHtml FROM Company WHERE id = 1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
                CKEditorControl1.Text = HttpUtility.HtmlDecode(reader["AbouutUsHtml"].ToString());
            }
            connection.Close();
        }

        protected void UploadAboutUsBtn_Click(object sender, EventArgs e)
        {   // 建立 Upload About Us Content
            //取得 CKEditorControl 的 HTML 內容
            string aboutUsHtmlStr = HttpUtility.HtmlEncode(CKEditorControl1.Text);
            //更新 About Us 頁面 HTML 資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "UPDATE Company SET AbouutUsHtml = @AbouutUsHtml WHERE id = 1";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@AbouutUsHtml", aboutUsHtmlStr);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            //渲染畫面提示
            DateTime nowtime = DateTime.Now;
            Response.Write("<script>alert('上傳成功')</script>");
            //UploadAboutUsLab.Visible = true;
            //UploadAboutUsLab.Text = "*Upload Success! - " + nowtime.ToString("G");


        }

       



        //取得 Certificat 頁文字說明資料
        private void loadCertificatContent()
        {   //建立 loadCertificatContent
            
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT CertificateCotent FROM Company WHERE id = 1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
                certificatTbox.Text = reader["CertificateCotent"].ToString();
            }
            connection.Close();
        }

        protected void uploadCertificatBtn_Click(object sender, EventArgs e)
        {
            //更新 Certificat 頁文字說明資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "UPDATE Company SET CertificateCotent = @CertificateCotent WHERE id = 1";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@CertificateCotent", certificatTbox.Text);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            //渲染畫面提示
            DateTime nowtime = DateTime.Now;
            Response.Write("<script>alert('上傳成功')</script>");
            uploadCertificatLab.Visible = true;
            uploadCertificatLab.Text = "*Upload Success! - " + nowtime.ToString("G");
        }

        private void loadCertificatPictureV()
        {   //建立 上傳證書的照片直

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT CertificateVertcalImgJSON FROM Company WHERE id = 1";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
                //CKEditorUpPicV.Text = reader["CertificateVertcalImgJSON"].ToString();
            }
            connection.Close();
        }

        protected void Btn_uploadCertiPicV_Click(object sender, EventArgs e)
        {
            List<string> imagePaths = new List<string>();

            // 保存上传的文件并获取文件路径
            SaveUploadedFiles(FUPicV1, imagePaths);
            SaveUploadedFiles(FUPicV2, imagePaths);
            SaveUploadedFiles(FUPicV3, imagePaths);
            SaveUploadedFiles(FUPicV4, imagePaths);
            SaveUploadedFiles(FUPicV5, imagePaths);
            SaveUploadedFiles(FUPicV6, imagePaths);
            SaveUploadedFiles(FUPicV7, imagePaths);

            // 将图片路径以 HTML 格式插入数据库
            string imagesHtml = GenerateImageHTML(imagePaths);

            // 更新数据库中的数据
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string sql = "UPDATE Company SET CertificateVertcalImgJSON = @CertificateVertcalImgJSON WHERE id = 1";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@CertificateVertcalImgJSON", imagesHtml);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('上傳成功')</script>");
                    // 可以添加逻辑检查 rowsAffected 是否为预期值来判断更新是否成功
                }
            }
            catch (Exception ex)
            {
                // 处理数据库更新时的异常
            }
        }

        private void SaveUploadedFiles(FileUpload fileUploadControl, List<string> imagePaths)
        {
            if (fileUploadControl.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(fileUploadControl.FileName);
                    string imagePath = Server.MapPath("~/upload/certificate/") + filename;
                    fileUploadControl.SaveAs(imagePath);
                    imagePaths.Add("upload/certificate/" + filename);
                }
                catch (Exception ex)
                {
                    // 处理上传文件时的异常
                }
            }
        }

        private string GenerateImageHTML(List<string> imagePaths)
        {
            StringBuilder imagesHtml = new StringBuilder();
            foreach (string path in imagePaths)
            {
                imagesHtml.Append("<p><img alt=\"\" src=\"" + path + "\" style=\"width: 200px; height: 283px;\" /></p>");
            }
            return imagesHtml.ToString();
        }




        protected void Btn_ComAbUs_Click(object sender, EventArgs e)
        {
            //Literal1.Text = CKEditorControl1.Text;
        }

        protected void Btn_clearall_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);
            {
                string sql = "UPDATE Company SET CertificateVertcalImgJSON = NULL WHERE id = 1";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();
                Response.Write("<script>alert('清除成功')</script>");
                // 可以添加逻辑检查 rowsAffected 是否为预期值来判断更新是否成功
            }
        }
    }
}