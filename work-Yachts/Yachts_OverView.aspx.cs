using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.IO;
using System.Web.Configuration;

namespace work_Yachts
{
    public partial class Yachts_OverView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //會先跑 Content 頁的 Page_Load 才跑 Master 頁的 Page_Load
            if (!IsPostBack)
            {
                loadContent();
            }
        }

        private void loadContent()
        {
            //取得 Session 共用 GUID，Session 物件需轉回字串
            string guidStr = Session["guid"].ToString();
            //依 GUID 取得遊艇資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "SELECT * FROM Yachts WHERE guid = @guidStr";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guidStr", guidStr);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder dimensionsTableHtmlStr = new StringBuilder();
            //List<RowData> saveRowList = new List<RowData>();
            if (reader.Read())
            {
                string yachtModelStr = reader["yachtModel"].ToString();
                string contentHtmlStr = HttpUtility.HtmlDecode(reader["overviewContentHtml"].ToString());
                string loadJson = HttpUtility.HtmlDecode(reader["overviewDimensionsJSON"].ToString());
                string dimensionsImgPathStr = reader["overviewDimensionsImgPath"].ToString();
                string downloadsFilePathStr = reader["overviewDownloadsFilePath"].ToString();
                // 取得檔案名稱
                string fileName = Path.GetFileName(downloadsFilePathStr);

                // 設定超連結文字，使用檔案名稱
                DownloadsHtml.Text = string.IsNullOrEmpty(downloadsFilePathStr)
                    ? string.Empty
                    : $"<a id='HyperLink1' href='{downloadsFilePathStr}' target='blank'>{fileName}</a>";

                ContentHtml.Text = contentHtmlStr;

                // 根據 downloadsFilePathStr 是否為空字串設定 divDownload 的可見性
                divDownload.Visible = !string.IsNullOrEmpty(downloadsFilePathStr);


            }
            connection.Close();



        }


    }
}