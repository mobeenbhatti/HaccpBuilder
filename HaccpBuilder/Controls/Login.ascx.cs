using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

using SchoolHaccp.Operational;

public partial class Controls_Login : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnDistrictLogin_Click(object sender, EventArgs e)
	{
		if (this.Page.IsValid)
		{
			//Session["Username"] = this.txtDistrictLogin.Text;
			Response.Redirect(Utilities.GetAuthenticationLoginUrl(this.Request.ApplicationPath));
		}
	}

	protected void btnKitchenLogin_Click(object sender, EventArgs e)
	{
		if (this.Page.IsValid)
		{
			//Session["Username"] = this.txtKitchenLogin.Text;
			Response.Redirect(Utilities.GetAuthenticationLoginUrl(this.Request.ApplicationPath));
		}
	}
}
