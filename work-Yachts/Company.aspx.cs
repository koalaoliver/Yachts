using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_Yachts
{
    public partial class company : System.Web.UI.Page
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
            //從資料庫取資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sqlCountry = "SELECT TOP 1 AbouutUsHtml FROM Company";
            SqlCommand command = new SqlCommand(sqlCountry, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
                Li_AbouUS.Text = HttpUtility.HtmlDecode(reader["AbouutUsHtml"].ToString());
            }
            connection.Close();
        }
    }
}