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

public partial class ErrorPage : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			if (Session != null)
			{
				if (Session["error"] != null)
					this.lblError.Text = "Technical Information: " + Session["error"].ToString();
			}
            if (Request.QueryString["error"] != null)
            {
                this.lblError.Text = "Technical Information: " + Request.QueryString["error"];
            }
		}
	}
}
