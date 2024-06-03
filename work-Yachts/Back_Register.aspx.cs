using Konscious.Security.Cryptography;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_Yachts.Back
{
    public partial class Back_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Account"] != null)
            //{
            //    // 已經登入，導向目標頁面
            //    Response.Redirect("Back_Register.aspx");
            //}
            //else
            //{
            //    // 未登入，導向登入頁面
            //    Response.Redirect("Backend_login.aspx");
            //}
        }

        //private void BindData()
        //{
        //    SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);

        //        string sql = "SELECT * FROM Member";
        //        SqlCommand cmd = new SqlCommand(sql, connection);
        //        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();

        //        connection.Open();
        //        adapter.Fill(dt); // 將資料填充至 DataTable

        //        GV_Member.DataSource = dt; // 資料繫結至 GridView
        //        GV_Member.DataBind(); // 执行資料繫結

        //        connection.Close(); // 關閉資料庫連接
        //    }

        //加鹽密碼-----------
        // Argon2 加密
        //產生 Salt 功能
        private byte[] CreateSalt()
        {
            var buffer = new byte[16];
            var rng = new RNGCryptoServiceProvider();
            rng.GetBytes(buffer);
            return buffer;
        }
        // Hash 處理加鹽的密碼功能
        private byte[] HashPassword(string password, byte[] salt)
        {
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password));

            //底下這些數字會影響運算時間，而且驗證時要用一樣的值
            argon2.Salt = salt;
            argon2.DegreeOfParallelism = 8; // 4 核心就設成 8
            argon2.Iterations = 4; // 迭代運算次數
            argon2.MemorySize = 1024 * 1024; // 1 GB

            return argon2.GetBytes(16);
        }

        protected void GV_Member_DataBound(object sender, EventArgs e)
        {
            
        }

        protected void BtnAddAccount_Click(object sender, EventArgs e)
        {
            bool haveSameAccount = false;

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sqlCheck = "SELECT * FROM Member WHERE Username = @Username";
            string sqlAdd = "INSERT INTO Member (Username, Password, Salt) VALUES(@Username, @Password, @Salt)";
            SqlCommand commandCheck = new SqlCommand(sqlCheck, connection);
            SqlCommand commandAdd = new SqlCommand(sqlAdd, connection);

            //檢查有無重複帳號
            commandCheck.Parameters.AddWithValue("@Username", txtAccount.Text);
            connection.Open();
            SqlDataReader readerCountry = commandCheck.ExecuteReader();
            if (readerCountry.Read())
            {
                haveSameAccount = true;
                LabelAdd.Visible = true; //帳號重複通知
            }
            connection.Close();

            //無重複帳號才執行加入
            if (!haveSameAccount)
            {
                //Hash 加鹽加密
                string password = txtPassword.Text;
                var salt = CreateSalt();
                string saltStr = Convert.ToBase64String(salt); //將 byte 改回字串存回資料表
                var hash = HashPassword(password, salt);
                string hashPassword = Convert.ToBase64String(hash);

                commandAdd.Parameters.AddWithValue("@Username", txtAccount.Text);
                commandAdd.Parameters.AddWithValue("@Password", hashPassword);
                commandAdd.Parameters.AddWithValue("@Salt", saltStr);

                connection.Open();
                commandAdd.ExecuteNonQuery();
                connection.Close();
                Response.Write("<script>alert('新增成功')</script>");
                //畫面渲染
                GV_Member.DataBind();
                //清空輸入欄位
                txtAccount.Text = "";
                txtPassword.Text = "";
                LabelAdd.Visible = false;
            }

        }

       
    }
}