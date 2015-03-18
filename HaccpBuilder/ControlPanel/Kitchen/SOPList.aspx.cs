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

public partial class ControlPanel_Kitchen_SOPList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //If C-TPAT Hide SOP button
        if (TypeId == 7)
        {
            rptCtpat.DataSource = sqlDsCtpat;
            rptCtpat.DataBind();
        }
        else
        {
            if (TypeId == 8)
            {
                rptCtpat.DataSource = sqlDsCtpat;
                rptCtpat.DataBind();
            }
            rptSOP.DataSource = sqlDSSOP;
            rptSOP.DataBind();
        }
    }
    public int TypeId
    {
        get
        {
            if (Session["TypeId"] != null)
                return (int)Session["TypeId"];
            else
            {
                Response.Redirect("~/ControlPanel/LogOut.aspx");
                return 0;
            }

        }
    }
}
