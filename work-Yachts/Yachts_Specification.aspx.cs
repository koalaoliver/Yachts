using System;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Configuration;

namespace work_Yachts
{
    public partial class Yachts_Specification : System.Web.UI.Page
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
            //取得 Session 共用 Guid，Session 物件需轉回字串
            string guidStr = Session["guid"].ToString();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            //依 Guid 取得型號資料
            string sql = "SELECT overviewDimensionsJSON FROM Yachts WHERE guid = @guidStr";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guidStr", guidStr);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                //渲染畫面
                ContentHtml.Text = reader["overviewDimensionsJSON"].ToString();

            }
            connection.Close();

        }
    }
        }
