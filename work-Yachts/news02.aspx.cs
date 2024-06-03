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


namespace work_Yachts
{
    public partial class news02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadNews();

            }
        }

        private void loadNews()
        {

            string guidStr = Request.QueryString["ID"];
            //如果沒有網址傳值就導回新聞列表頁
            if (String.IsNullOrEmpty(guidStr))
            {
                Response.Redirect("~/news01.aspx");
            }
            //依取得 guid 連線資料庫取得新聞資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT * FROM News WHERE Guid = @Guid";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Guid", guidStr.Trim());
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染新聞標題
                newsTitle.InnerText = reader["Headline"].ToString();
                //渲染新聞主文
                string combinedContent = reader["NewsContentHtml"].ToString() + reader["NewsImageJson"].ToString();
                newsContent.Text = HttpUtility.HtmlDecode(combinedContent);

            }
            connection.Close();
            //渲染新聞組圖
            //if (savePathList?.Count > 0)
            //{
            //    string imgHtmlStr = "";
            //    foreach (var item in savePathList)
            //    {
            //        imgHtmlStr += $"<p><img alt='Image' src='upload/news/{item.SavePath}' style='width: 700px;' /></p>";
            //    }
            //    groupImg.Text = HttpUtility.HtmlDecode(imgHtmlStr);
            //}
        }

        //private void loadNewsImage()
        //{
        //    List<ImagePath> savePathList = new List<ImagePath>();
        //    string guidStr = Request.QueryString["ID"];
        //    //如果沒有網址傳值就導回新聞列表頁
        //    if (String.IsNullOrEmpty(guidStr))
        //    {
        //        Response.Redirect("~/news01.aspx");
        //    }
        //    //依取得 guid 連線資料庫取得新聞資料
        //    SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
        //    string sql = "SELECT * FROM News WHERE Guid = @Guid";
        //    SqlCommand command = new SqlCommand(sql, connection);
        //    command.Parameters.AddWithValue("@Guid", guidStr.Trim());
        //    connection.Open();
        //    SqlDataReader reader = command.ExecuteReader();
        //    if (reader.Read())
        //    {
        //        //渲染新聞標題
        //        newsTitle.InnerText = reader["Headline"].ToString();
        //        //渲染新聞主文
        //        NewsImage.Text = HttpUtility.HtmlDecode(reader["NewsImageJson"].ToString());
        //        //string loadJson = HttpUtility.HtmlDecode(reader["NewsImageJson"].ToString());

        //    }
        //    connection.Close();

        //}


    }
}