using MimeKit;
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
    public partial class Back_Dealer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DDSelCountry.DataBind();
                
            }

        }
       
        protected void BtnAddCountry_Click(object sender, EventArgs e)
        {
            // 1. 連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);

            // 2. 檢查是否已存在相同的國家名稱
            string checkSql = "SELECT COUNT(*) FROM Country WHERE Country = @Country";
            SqlCommand checkCommand = new SqlCommand(checkSql, connection);
            checkCommand.Parameters.AddWithValue("@Country", txtCountry.Text);

            connection.Open();

            int existingCount = (int)checkCommand.ExecuteScalar();

            connection.Close();

            // 如果已存在相同的國家名稱，顯示新增失敗
            if (existingCount > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "新增失敗", "alert('國家已存在，新增失敗');", true);
            }
            else
            {
                // 3. SQL 語法
                string sql = "INSERT INTO Country (Country) VALUES(@Country)";

                // 4. 創建 command 物件
                SqlCommand command = new SqlCommand(sql, connection);

                // 5. 參數化避免攻擊
                command.Parameters.AddWithValue("@Country", txtCountry.Text);

                // 6. 資料庫連線開啟
                connection.Open();

                // 7. 執行 SQL (新增刪除修改)
                int rowsAffected = command.ExecuteNonQuery(); // 僅執行一次

                // 資料庫關閉
                connection.Close();

                // 清空輸入欄位
                txtCountry.Text = "";

                // 判斷是否成功新增資料
                if (rowsAffected > 0)
                {
                    // 新增成功，顯示訊息視窗
                    ClientScript.RegisterStartupScript(this.GetType(), "新增成功", "alert('新增成功');", true);
                }
                else
                {
                    // 新增失敗，顯示訊息視窗
                    ClientScript.RegisterStartupScript(this.GetType(), "新增失敗", "alert('新增失敗');", true);
                }

                // 重新整理頁面
                Response.Redirect(Request.RawUrl);
            }
        }




        protected void Btn_updealer_Click(object sender, EventArgs e)
        {

            string selCountry_id = DropDownDealer.SelectedValue;

            string fileName = Path.GetFileName(FileUploadpic.FileName);
            string filePath = Server.MapPath("~/upload/Images/" + fileName);

            FileUploadpic.SaveAs(filePath);



            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            string sql = "INSERT INTO Dealers (Area, DealerImgPath, Name, Contact, Address, Tel, Fax, Email, Link, frk_countryID) VALUES (@Area, @DealerImgPath, @Name, @Contact, @Address, @Tel, @Fax, @Email, @Link ,@frk_countryID)";

            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Area", Textarea.Text);
            command.Parameters.AddWithValue("@DealerImgPath", fileName);
            command.Parameters.AddWithValue("@Name", Txtname.Text);
            command.Parameters.AddWithValue("@Contact", Txtcontact.Text);
            command.Parameters.AddWithValue("@Address", Txtaddress.Text);
            command.Parameters.AddWithValue("@Tel", Txttel.Text);
            command.Parameters.AddWithValue("@Fax", Txtfax.Text);
            command.Parameters.AddWithValue("@Email", Txtmail.Text);
            command.Parameters.AddWithValue("@Link", Txtlink.Text);
            command.Parameters.AddWithValue("@frk_countryID", selCountry_id);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            //渲染上傳成功提示
            Response.Write("<script>alert('更新成功')</script>");
            DateTime nowtime = DateTime.Now;
            UpdateDealerListLab.Visible = true;
            UpdateDealerListLab.Text = "*Upload Success! - " + nowtime.ToString("G");
            Page.SetFocus(UpdateDealerListLab);
           

            
        }
        //最下面下拉式選單選擇國家
        private void showDealerList()
        {
            string selCountry_id = DDSelCountry.SelectedValue;

            // 連接資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["OliverDB"].ConnectionString);
            {
                // 建立 SQL 查詢
                string sql = "SELECT * FROM Dealers WHERE frk_countryID = @selCountry_id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@selCountry_id", selCountry_id);

                // 開啟資料庫連線
                connection.Open();

                // 建立資料讀取器，讀取資料
                SqlDataReader reader = command.ExecuteReader();

                // 將資料繫結到 GridView
                GVSelContry.DataSource = reader;
                GVSelContry.DataBind();

                // 關閉資料讀取器和資料庫連線
                reader.Close();
                connection.Close();
            }

        }




        protected void GV_Country_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DDSelCountry.DataBind();
        }



        protected void DDSelCountry_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //showDealerList();
        }

        protected void GVSelContry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource4_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            FileUpload FileUpload1test = (FileUpload)GVSelContry.Rows[GVSelContry.EditIndex].FindControl("FileUpload1");

            if (FileUpload1test != null && FileUpload1test.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1test.PostedFile.FileName);
                string filePath = Server.MapPath("~/upload/Images") + fileName; // YourDirectory 應該是您儲存檔案的目錄

                FileUpload1test.SaveAs(filePath);
                e.Command.Parameters["@DealerImgPath"].Value = fileName; // 更新資料庫欄位
            }
        }
    }
}



