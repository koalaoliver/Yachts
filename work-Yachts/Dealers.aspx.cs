using MimeKit;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_Yachts
{
    public partial class dealers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getCountryID(); //取得國家 id
            loadLeftMenu();
            loadDealerList();
        }

        private void getCountryID()
        {
            //取得網址傳值的 id 內容
            string urlIDStr = Request.QueryString["id"];

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            //如果是用短網址連入則用短網址 shortUrl 參數內容的國家名稱來判斷 ID
            if (Page.RouteData.Values.Count > 0)
            {
                //取得短網址參數內容的國家名稱
                string urlCountryStr = Page.RouteData.Values["shortUrl"].ToString();
                string sqlID = "SELECT ID FROM Country WHERE Country = @urlCountryStr";
                SqlCommand commandID = new SqlCommand(sqlID, connection);
                commandID.Parameters.AddWithValue("@urlCountryStr", urlCountryStr);
                connection.Open();
                SqlDataReader readerID = commandID.ExecuteReader();
                if (readerID.Read())
                {
                    urlIDStr = readerID["id"].ToString();
                }
                connection.Close();
            }

            //如無網址傳值則設為第一筆國家名稱 id
            if (string.IsNullOrEmpty(urlIDStr))
            {
                string sql = "SELECT TOP 1 id FROM Country";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    urlIDStr = reader["id"].ToString();
                }
                connection.Close();
            }

            //將 id 存入 Session 使用
            Session["id"] = urlIDStr;
        }


        private void loadLeftMenu()
    {
        //反覆變更字串的值建議用 StringBuilder 效能較好
        StringBuilder leftMenuHtml = new StringBuilder();

        //取得國家分類
        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
        string sqlCountry = "SELECT * FROM Country";
        SqlCommand commandCountry = new SqlCommand(sqlCountry, connection);
        connection.Open();
        SqlDataReader readerCountry = commandCountry.ExecuteReader();
        while (readerCountry.Read())
        {
            string idStr = readerCountry["ID"].ToString();
            string countryStr = readerCountry["Country"].ToString();
            // StringBuilder 用 Append 加入字串內容
            leftMenuHtml.Append($"<li><a href='dealers.aspx?id={idStr}'> {countryStr} </a></li>");
        }
        connection.Close();

        //渲染畫面
        LeftMenu.Text = leftMenuHtml.ToString();
    }
    private void loadDealerList()
    {
        //取得 Session 儲存 id，Session 物件需轉回字串
        string countryIDStr = Session["id"].ToString();

        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
        string sql = "SELECT Country FROM Country WHERE ID = @countryIDStr";
        SqlCommand command = new SqlCommand(sql, connection);
        command.Parameters.AddWithValue("@countryIDStr", countryIDStr);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            string countryStr = reader["Country"].ToString();
            labLink.InnerText = countryStr;
            LitTitle.InnerText = countryStr;
        }
        connection.Close();

        //依 country id 取得代理商資料
        StringBuilder dealerListHtml = new StringBuilder();
        string sqlArea = "SELECT * FROM Dealers WHERE frk_countryID = @countryIDStr";
        SqlCommand commandArea = new SqlCommand(sqlArea, connection);
        commandArea.Parameters.AddWithValue("@countryIDStr", countryIDStr);
        connection.Open();
        SqlDataReader readerArea = commandArea.ExecuteReader();
        while (readerArea.Read())
        {
            string idStr = readerArea["ID"].ToString();
            string areaStr = readerArea["Area"].ToString();
            string imgPathStr = readerArea["DealerImgPath"].ToString();
            string nameStr = readerArea["Name"].ToString();
            string contactStr = readerArea["Contact"].ToString();
            string addressStr = readerArea["Address"].ToString();
            string telStr = readerArea["Tel"].ToString();
            string faxStr = readerArea["Fax"].ToString();
            string emailStr = readerArea["Email"].ToString();
            string linkStr = readerArea["Link"].ToString();
            dealerListHtml.Append("<li><div class='list02'><ul><li class='list02li'><div>" +
        $"<p><img id='Image{idStr}' src='../upload/{imgPathStr}' style='border-width:0px;' Width='209px' /> </p></div></li>" +
        $"<li class='list02li02'> <span>{areaStr}</span><br />");
            if (!string.IsNullOrEmpty(nameStr))
            {
                dealerListHtml.Append($"{nameStr}<br />");
            }
            if (!string.IsNullOrEmpty(contactStr))
            {
                dealerListHtml.Append($"Contact：{contactStr}<br />");
            }
            if (!string.IsNullOrEmpty(addressStr))
            {
                dealerListHtml.Append($"Address：{addressStr}<br />");
            }
            if (!string.IsNullOrEmpty(telStr))
            {
                dealerListHtml.Append($"TEL：{telStr}<br />");
            }
            if (!string.IsNullOrEmpty(faxStr))
            {
                dealerListHtml.Append($"FAX：{faxStr}<br />");
            }
            if (!string.IsNullOrEmpty(emailStr))
            {
                dealerListHtml.Append($"E-Mail：{emailStr}<br />");
            }
            if (!string.IsNullOrEmpty(linkStr))
            {
                dealerListHtml.Append($"<a href='{linkStr}' target='_blank'>{linkStr}</a>");
            }
            dealerListHtml.Append("</li></ul></div></li>");
        }
        connection.Close();

        //渲染畫面
        DealerList.Text = dealerListHtml.ToString();
    }
}
}