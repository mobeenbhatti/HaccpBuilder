using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HaccpBuilder.ControlPanel
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string test = "hello";
            FormsAuthentication.SignOut();
            Session["KitchenId"] = null;
            Session["TypeID"] = null;
            Session.Abandon();
            Response.Redirect("~/ControlPanel/Membership/LoginPage.aspx", true);

        }
    }
}