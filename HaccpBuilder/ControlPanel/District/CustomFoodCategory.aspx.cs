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

public partial class ControlPanel_District_CustomFoodCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!this.IsPostBack)
        {
            ddlKitchen.DataBind();
            if (Request.QueryString["GroupId"] != null)
            {
                ddlKitchen.SelectedValue = Request.QueryString["GroupId"];
            }
            SetAdditionalButton();
        }

    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void ddlKitchen_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetAdditionalButton();
    }
    protected void grdFoodCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox chkDefault, chkCustom, chkRemove;
        Label lblIsAdditional;
        LinkButton lkbEdit;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            chkDefault = (CheckBox)e.Row.FindControl("chkDefault");
            chkRemove = (CheckBox)e.Row.FindControl("chkRemove");
            chkCustom = (CheckBox)e.Row.FindControl("chkCustom");
            lblIsAdditional = (Label)e.Row.FindControl("lblIsAdditional");
            lkbEdit = (LinkButton)e.Row.FindControl("lkbEditFoodCategory");

            if (chkDefault != null && chkCustom != null && chkRemove != null && lblIsAdditional != null)
            {
                if (ddlKitchen.SelectedItem.Text != "USDA DEFAULT FOOD CATEGORY")
                {
                    chkDefault.Attributes.Add("onclick", "checkDefault(" + chkDefault.ClientID + "," + chkCustom.ClientID + "," + chkRemove.ClientID + ")");
                    chkRemove.Attributes.Add("onclick", "checkRemove(" + chkDefault.ClientID + "," + chkCustom.ClientID + "," + chkRemove.ClientID + ")");
                    chkCustom.Attributes.Add("onclick", "checkCustom(" + chkDefault.ClientID + "," + chkCustom.ClientID + "," + chkRemove.ClientID + ")");
                    if (lblIsAdditional.Text == "Yes")
                    {
                        chkDefault.Visible = false;
                        chkCustom.Visible = false;
                    }
                    if (chkRemove.Checked == true)
                    {
                        chkDefault.Checked = false;
                        chkCustom.Checked = false;
                    }
                }
                else
                {
                    chkCustom.Enabled = false;
                    chkRemove.Enabled = false;
                    chkDefault.Enabled = false;
                    lkbEdit.Enabled = false;
                }
                if ((int)Session["TypeId"] == 3)
                {
                    // Disable Reporting                  
                    e.Row.Cells[2].Enabled = false;
                }
                else
                {
                    e.Row.Cells[2].Enabled = (DataBinder.Eval(e.Row.DataItem, "Custom").ToString()=="1"?true:false);
                    
                }
            }
        }
    }
    protected void chkCustom_CheckedChanged(object sender, EventArgs e)
    {
        // Create New Custom FoodCategory based on Default FoodCategory
        CheckBox chkCustom = (CheckBox)sender;
        if (chkCustom.Checked == true)
        {
            saveData();
            string strFoodCategoryId, strGroupId;
            strFoodCategoryId = chkCustom.Text;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditFoodCategory.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=1");
            Response.Redirect("~/ControlPanel/District/EditFoodCategory.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=1");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.Browser.ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditFoodCategoryIE.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=1");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditFoodCategory1.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=1");
            //}

        }
    }
    protected void chkDefault_CheckedChanged(object sender, EventArgs e)
    {

        HiddenField hfFoodCategoryId;
        CheckBox chkDefault, chkCustom;
        chkDefault = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkDefault.NamingContainer;
        if (chkDefault.Checked == true)
        {
            hfFoodCategoryId = (HiddenField)row.FindControl("hfFoodCategoryId");
            chkCustom = (CheckBox)row.FindControl("chkCustom");
            //chkRemove = (CheckBox)row.FindControl("chkRemove");
            if (hfFoodCategoryId != null || chkCustom != null)
            {
                if (chkDefault.Text == hfFoodCategoryId.Value)
                {
                    if (chkCustom.Checked == true)
                    {
                        //Delete Custom FoodCategory and Select Default FoodCategory
                        FoodCategories FoodCategory = new FoodCategories();
                        FoodCategory.FoodCategoryId = int.Parse(chkDefault.Text);
                        ProcessDeleteFoodCategory deleteFoodCategory = new ProcessDeleteFoodCategory();
                        deleteFoodCategory.FoodCategory = FoodCategory;
                        deleteFoodCategory.Invoke();
                        chkCustom.Checked = false;
                        grdFoodCategory.DataBind();

                    }
                }
            }
        }
    }
    protected void cmdContinue_Click(object sender, EventArgs e)
    {
        //CheckBox chkRemove;
        //HiddenField hfFoodCategoryId;

        //foreach (GridViewRow row in grdFoodCategory.Rows)
        //{
        //    chkRemove = (CheckBox)row.FindControl("chkRemove");
        //    hfFoodCategoryId = (HiddenField)row.FindControl("hfFoodCategoryId");
        //    if (chkRemove != null && hfFoodCategoryId != null)
        //    {
        //        FoodCategory FoodCategory = new FoodCategory();
        //        FoodCategory.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);
        //        if (chkRemove.Checked == true)
        //        {
        //            FoodCategory.Removed = 1;
        //        }
        //        else
        //        {
        //            FoodCategory.Removed = 0;
        //        }
        //        ProcessSetFoodCategory setFoodCategory = new ProcessSetFoodCategory();
        //        setFoodCategory.FoodCategory = FoodCategory;
        //        setFoodCategory.FoodCategorySelection();
        //    }
        //}
        saveData();
        Response.Redirect("~/ControlPanel/District/FoodCategoryReview.aspx?GroupId=" + ddlKitchen.SelectedValue);


    }
    protected void grdFoodCategory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGroupId, strFoodCategoryId;
            strFoodCategoryId = e.CommandName;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditFoodCategory.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=3");
            Response.Redirect("~/ControlPanel/District/EditFoodCategory.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=3");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.Browser.ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditFoodCategoryIE1.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=3");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditFoodCategoryIE1.aspx?FoodCategoryId=" + strFoodCategoryId + "&GroupId=" + strGroupId + "&Mode=3");
            //}
        }
    }
    protected void btnEditFoodCategoryGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/FoodCategoryGroup.aspx");
    }
    protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    private void saveData()
    {
        CheckBox chkRemove;
        HiddenField hfFoodCategoryId;

        foreach (GridViewRow row in grdFoodCategory.Rows)
        {
            chkRemove = (CheckBox)row.FindControl("chkRemove");
            hfFoodCategoryId = (HiddenField)row.FindControl("hfFoodCategoryId");
            if (chkRemove != null && hfFoodCategoryId != null)
            {
                FoodCategories FoodCategory = new FoodCategories();
                FoodCategory.FoodCategoryId = int.Parse(hfFoodCategoryId.Value);
                if (chkRemove.Checked == true)
                {
                    FoodCategory.Active = 0;
                }
                else
                {
                    FoodCategory.Active = 1;
                }
                ProcessSetFoodCategory setFoodCategory = new ProcessSetFoodCategory();
                setFoodCategory.FoodCategory = FoodCategory;
                setFoodCategory.FoodCategorySelection();
            }
        }
    }
    protected void cmdAdditionalFoodCategory_Click(object sender, EventArgs e)
    {
        saveData();
        string strGroupId;
        strGroupId = ddlKitchen.SelectedValue;
        Response.Redirect("~/ControlPanel/District/EditFoodCategory.aspx?GroupId=" + strGroupId + "&Mode=2");
        /////////////////////////////////
        // Check Bowser Type           //
        /////////////////////////////////
        //if (Request.Browser.ToString().ToUpper() == "IE")
        //{
        //    Response.Redirect("~/ControlPanel/District/EditFoodCategoryIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
        //else
        //{
        //    Response.Redirect("~/ControlPanel/District/EditFoodCategoryIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
    }
    private void SetAdditionalButton()
    {
        if (ddlKitchen.SelectedItem.Text == "USDA DEFAULT FOOD CATEGORY" || ddlKitchen.SelectedItem.Text == " -- SELECT VALUE -- ")
        {

            cmdAdditionalFoodCategory.Visible = false;
        }
        else
        {

            cmdAdditionalFoodCategory.Visible = true;
        }
    }
}
