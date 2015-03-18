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

public partial class ControlPanel_InventoryItemManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TypeId == 7)
            Response.Redirect("~/ControlPanel/Kitchen/ErrorPage.aspx");
        Label1.Text = DateTime.Now.ToShortDateString();

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    //protected void btnEditPlan_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
    //}
    //protected void btnMenuManager_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/ControlPanel/Kitchen/MenuItemManager.aspx");
    //}
    protected void btnInventoryManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
    }
    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/CustomInventory.aspx");
    }
    protected void btnAlerts_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/LogAlerts.aspx");
    }
    protected void btnMenuManager_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx");
    }
    protected void btnEditPlan_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/ProceduralQuestions.aspx");
    }
    protected void btnViewSop_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SOPList.aspx");
    }
    protected void cmdAddVendor_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Vendors.aspx");
    }
    protected void cmdAddIngredient_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Ingredients.aspx");
    }
    protected void cmdAddMenuItem_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx");
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
