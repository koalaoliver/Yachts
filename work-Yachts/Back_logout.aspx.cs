using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace work_Yachts.Back
{
    public partial class Back_logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Write("<script>alert('登出成功')</script>");
            Response.Redirect("/Backend_login.aspx");
        }
    }
}