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
using SchoolHaccp.Operational;

public partial class ControlPanel_District_Kitchens : WebRoles
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsAuthorised(System.IO.Path.GetDirectoryName(Request.ServerVariables["SCRIPT_NAME"])))
        {
            Response.Redirect("~/ControlPanel/Default.aspx");
        }

    }
}
