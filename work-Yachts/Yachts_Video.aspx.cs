using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

namespace work_Yachts
{
    public partial class Yachts_Video : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadContent();
            }
        }

        private void loadContent()
        {
            // 取得 Session 共用 Guid，Session 物件需轉回字串
            string guidStr = Session["guid"].ToString();

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);

            // 依 Guid 取得型號資料
            string sql = "SELECT youtubeUrl FROM Yachts WHERE guid = @guid";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guid", guidStr);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                // 取得 youtubeUrl 字段的值
                string youtubeUrlStr = reader["youtubeUrl"].ToString();

                if (String.IsNullOrEmpty(youtubeUrlStr))
                {
                    // 如果 youtubeUrl 为空，重定向到指定页面
                    Response.Redirect($"Yachts_OverView.aspx?id={guidStr}");
                }
                else
                {
                    // 构建嵌入链接
                    string strNewUrl = "https://www.youtube.com/embed/" + GetYouTubeVideoId(youtubeUrlStr);

                    // 更新 <iframe> src 連結
                    video.Attributes.Add("src", strNewUrl);
                }
            }

            connection.Close();
        }

        // 辅助方法：从 YouTube 链接中提取视频 ID
        private string GetYouTubeVideoId(string youtubeUrl)
        {
            string videoId = string.Empty;

            try
            {
                Uri uri = new Uri(youtubeUrl);
                string query = uri.Query;
                videoId = HttpUtility.ParseQueryString(query)["v"];
            }
            catch (Exception ex)
            {
                // 处理异常，例如不是有效的 URL
                Console.WriteLine(ex.Message);
            }

            return videoId;
        }

        // JSON 資料
        public class RowData
        {
            public string SaveItem { get; set; }
            public string SaveValue { get; set; }
        }
    }
}