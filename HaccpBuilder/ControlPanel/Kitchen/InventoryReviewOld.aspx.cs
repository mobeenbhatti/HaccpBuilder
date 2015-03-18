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

public partial class ControlPanel_Kitchen_InventoryReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/CustomInventory.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    protected void cmdContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Vendors.aspx");
    }
}
