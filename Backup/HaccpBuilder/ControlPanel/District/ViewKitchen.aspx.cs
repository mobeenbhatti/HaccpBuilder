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

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_ViewKitchen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAssignKitchen_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        DataSet dsKitchenDetails = kitchen.GetKitchensByDistrictId((int)Session["DistrictId"], txtKitchen.Text);
        grdKitchenDetails.Visible = false;
        grdSearchKitchen.Visible = true;
        grdSearchKitchen.DataSource = dsKitchenDetails;
        grdSearchKitchen.DataBind();
    }
}
