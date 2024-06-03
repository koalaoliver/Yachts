using Newtonsoft.Json;
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
    public partial class Certificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadContentText();
                loadContentImgV();
                loadContentImgH();
            }

        }
        private void loadContentText()
        {
            //從資料庫取內文資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sqlCountry = "SELECT CertificateCotent FROM Company";
            SqlCommand command = new SqlCommand(sqlCountry, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
                ContentText.Text = reader["CertificateCotent"].ToString();
                //ContentText.Text = reader["CertificateCotent"].ToString();
            }
            connection.Close();
        }

        private void loadContentImgV()
        {
            //從資料庫取內文資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sqlCountry = "SELECT CertificateVertcalImgJSON FROM Company";
            SqlCommand command = new SqlCommand(sqlCountry, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
               
                ContentImgV.Text = reader["CertificateVertcalImgJSON"].ToString();
                //ContentText.Text = reader["CertificateCotent"].ToString();
            }
            connection.Close();
        }


        private void loadContentImgH()
        {
            //從資料庫取內文資料
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sqlCountry = "SELECT CertificateHorizontallmgJSON FROM Company";
            SqlCommand command = new SqlCommand(sqlCountry, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                //渲染畫面
                ContentImgH.Text = reader["CertificateHorizontallmgJSON"].ToString();
                //ContentText.Text = reader["CertificateCotent"].ToString();
            }
            connection.Close();
        }

       
   
    }
}