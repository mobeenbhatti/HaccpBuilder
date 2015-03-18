using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ControlPanel_Membership_Loginfailure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Category"] != null)
        {
            if (Request.QueryString["Category"] == "1")
            {
                lblMessage.Text = "We are sorry, your location login has been deactivated.  Please contact HACCP Builder with any questions.";
            }
            if (Request.QueryString["Category"] == "3")
            {
                lblMessage.Text = "We are sorry, your corporate login has been deactivated.  Please contact HACCP Builder with any questions.";
            }
            if (Request.QueryString["Category"] == "2")
            {
                lblMessage.Text = "We are sorry, you can't logged into the site, as Free Trial is Expired    ";
            }
        }
    }
}
