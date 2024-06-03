using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_Yachts
{
    public partial class Back_User : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //清除Cache，避免登出後按上一頁還會顯示Cache頁面
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //權限關門判斷 (Cookie)
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Backend_login.aspx"); //導回登入頁
            }
            else
            {
                //取得驗證票夾帶資訊
                string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                string[] ticketUserDataArr = ticketUserData.Split(';');
                bool haveRight = HttpContext.Current.User.Identity.IsAuthenticated;
               
                   
                }
            }
        }
    }
