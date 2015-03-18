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
using SchoolHaccp.Operational;


public partial class ControlPanel_Kitchen_safetycheck : WebRoles
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_Init(object sender, EventArgs e)
    {
        string strDirectoryname;

        strDirectoryname = System.IO.Path.GetDirectoryName(Request.ServerVariables["SCRIPT_NAME"]);
        if (!IsAuthorised(strDirectoryname))
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }

    }
}
