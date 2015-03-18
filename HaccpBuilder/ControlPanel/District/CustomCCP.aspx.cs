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

public partial class ControlPanel_District_CustomCCP : System.Web.UI.Page
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
    protected void grdCCP_RowDataBound(object sender, GridViewRowEventArgs e)
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
            lkbEdit = (LinkButton)e.Row.FindControl("lkbEditCCP");

            if (chkDefault != null && chkCustom != null && chkRemove != null && lblIsAdditional != null)
            {
                if (ddlKitchen.SelectedItem.Text != "USDA DEFAULT CCP")
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
            }
        }
    }
    protected void chkCustom_CheckedChanged(object sender, EventArgs e)
    {
        // Create New Custom CCP based on Default CCP
        CheckBox chkCustom = (CheckBox)sender;
        if (chkCustom.Checked == true)
        {
            saveData();
            string strCCPId, strGroupId;
            strCCPId = chkCustom.Text;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditCCP.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=1");
            Response.Redirect("~/ControlPanel/District/EditCCP.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=1");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.Browser.ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditCCPIE.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=1");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditCCP1.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=1");
            //}

        }
    }
    protected void chkDefault_CheckedChanged(object sender, EventArgs e)
    {

        HiddenField hfCCPId;
        CheckBox chkDefault, chkCustom;
        chkDefault = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkDefault.NamingContainer;
        if (chkDefault.Checked == true)
        {
            hfCCPId = (HiddenField)row.FindControl("hfCCPId");
            chkCustom = (CheckBox)row.FindControl("chkCustom");
            //chkRemove = (CheckBox)row.FindControl("chkRemove");
            if (hfCCPId != null || chkCustom != null)
            {
                if (chkDefault.Text == hfCCPId.Value)
                {
                    if (chkCustom.Checked == true)
                    {
                        //Delete Custom CCP and Select Default CCP
                        CCPs CCP = new CCPs();
                        CCP.CCPId = int.Parse(chkDefault.Text);
                        ProcessDeleteCCP deleteCCP = new ProcessDeleteCCP();
                        deleteCCP.CCP = CCP;
                        deleteCCP.Invoke();
                        chkCustom.Checked = false;
                        grdCCP.DataBind();

                    }
                }
            }
        }
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        //CheckBox chkRemove;
        //HiddenField hfCCPId;

        //foreach (GridViewRow row in grdCCP.Rows)
        //{
        //    chkRemove = (CheckBox)row.FindControl("chkRemove");
        //    hfCCPId = (HiddenField)row.FindControl("hfCCPId");
        //    if (chkRemove != null && hfCCPId != null)
        //    {
        //        CCP CCP = new CCP();
        //        CCP.CCPId = int.Parse(hfCCPId.Value);
        //        if (chkRemove.Checked == true)
        //        {
        //            CCP.Removed = 1;
        //        }
        //        else
        //        {
        //            CCP.Removed = 0;
        //        }
        //        ProcessSetCCP setCCP = new ProcessSetCCP();
        //        setCCP.CCP = CCP;
        //        setCCP.CCPSelection();
        //    }
        //}
        saveData();
        Response.Redirect("~/ControlPanel/District/CCPReview.aspx?GroupId=" + ddlKitchen.SelectedValue);


    }
    protected void grdCCP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGroupId, strCCPId;
            strCCPId = e.CommandName;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditCCP.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=3");
            Response.Redirect("~/ControlPanel/District/EditCCP.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=3");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.Browser.ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditCCPIE1.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=3");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditCCPIE1.aspx?CCPId=" + strCCPId + "&GroupId=" + strGroupId + "&Mode=3");
            //}
        }
    }
    protected void btnEditCCPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CCPGroup.aspx");
    }
    protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    private void saveData()
    {
        CheckBox chkRemove;
        HiddenField hfCCPId;

        foreach (GridViewRow row in grdCCP.Rows)
        {
            chkRemove = (CheckBox)row.FindControl("chkRemove");
            hfCCPId = (HiddenField)row.FindControl("hfCCPId");
            if (chkRemove != null && hfCCPId != null)
            {
                CCPs CCP = new CCPs();
                CCP.CCPId = int.Parse(hfCCPId.Value);
                if (chkRemove.Checked == true)
                {
                    CCP.Active = 0;
                }
                else
                {
                    CCP.Active = 1;
                }
                ProcessSetCCP setCCP = new ProcessSetCCP();
                setCCP.CCP = CCP;
                setCCP.CCPSelection();
            }
        }
    }
    protected void cmdAdditionalCCP_Click(object sender, ImageClickEventArgs e)
    {
        saveData();
        string strGroupId;
        strGroupId = ddlKitchen.SelectedValue;
        Response.Redirect("~/ControlPanel/District/EditCCP.aspx?GroupId=" + strGroupId + "&Mode=2");
        /////////////////////////////////
        // Check Bowser Type           //
        /////////////////////////////////
        //if (Request.Browser.ToString().ToUpper() == "IE")
        //{
        //    Response.Redirect("~/ControlPanel/District/EditCCPIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
        //else
        //{
        //    Response.Redirect("~/ControlPanel/District/EditCCPIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
    }
    private void SetAdditionalButton()
    {
        if (ddlKitchen.SelectedItem.Text == "USDA DEFAULT CCP" || ddlKitchen.SelectedItem.Text == " -- SELECT VALUE -- ")
        {

            cmdAdditionalCCP.Visible = false;
        }
        else
        {

            cmdAdditionalCCP.Visible = true;
        }
    }
}
