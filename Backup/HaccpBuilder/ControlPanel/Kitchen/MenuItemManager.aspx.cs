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

public partial class ControlPanel_MenuItemManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToShortDateString();

    }       
    protected void btnViewCalendar_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("~/ControlPanel/Kitchen/MealServingCalendar.aspx");
        Response.Redirect("~/ControlPanel/Kitchen/MealServingCalendar2.aspx");
    }
    protected void btnAlerts_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/CustomMenuItems.aspx");
    }

    protected void btnMenuManager_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx");
    }
    protected void btnInventoryManager_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
    }
    protected void btnEditPlan_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/ProceduralQuestions.aspx");
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    protected void btnViewSop_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SOPList.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //
        
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
        //Response.Redirect("~/ControlPanel/Kitchen/AutoComplete.aspx");
    }
    protected void grdMenuItems_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblPreparation = (Label)e.Row.FindControl("lblPreparation");
            Label lblName = (Label)e.Row.FindControl("lblName");



            string strval = lblName.Text;
            string title = (string)ViewState["title"];
            if (title == strval)
            {
                lblName.Visible = false;
                lblName.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;
                lblPreparation.Visible = false;
                lblPreparation.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                lblName.Visible = true;
                lblProcess.Visible = true;
                lblPreparation.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
        
    }
    protected void grdMenuItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Hazard")
        {
            int nFoodCategoryId = int.Parse(e.CommandArgument.ToString());
            ProcessGetFoodCategory getFoodCategory = new ProcessGetFoodCategory();
            DataSet ds = getFoodCategory.GetFoodCategoryByID(nFoodCategoryId);
            dtvFoodCategory.DataSource = ds;
            dtvFoodCategory.DataBind();
            ModalPopupExtender1.PopupControlID = this.divPopUp.ID;
            ModalPopupExtender1.PopupDragHandleControlID = this.panelDragHandle.ID;
            ModalPopupExtender1.Show();
        }
    }
}
