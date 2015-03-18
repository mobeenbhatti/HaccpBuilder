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

public partial class ControlPanel_District_CustomSOP : System.Web.UI.Page
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
    protected void grdSOP_RowDataBound(object sender, GridViewRowEventArgs e)
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
                lkbEdit = (LinkButton)e.Row.FindControl("lkbEditSOP");
                
                    if (chkDefault != null && chkCustom != null && chkRemove != null && lblIsAdditional != null)
                    {
                        if (ddlKitchen.SelectedItem.Text != "USDA DEFAULT SOP")
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
        // Create New Custom SOP based on Default SOP
        CheckBox chkCustom = (CheckBox)sender;        
        if (chkCustom.Checked == true)
        {
            saveData();
            string strSOPId, strGroupId;
            strSOPId = chkCustom.Text;
            strGroupId = ddlKitchen.SelectedValue;
            Response.Redirect("~/ControlPanel/District/EditSOPIE1.aspx?SOPId=" + strSOPId + "&GroupId=" + strGroupId + "&Mode=1");

        }
    }
    protected void chkDefault_CheckedChanged(object sender, EventArgs e)
    {
        
        HiddenField hfSOPId;
        CheckBox chkDefault, chkCustom;
        chkDefault = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkDefault.NamingContainer;
        if (chkDefault.Checked == true)
        {
            hfSOPId = (HiddenField)row.FindControl("hfSOPId");
            chkCustom = (CheckBox)row.FindControl("chkCustom");
            //chkRemove = (CheckBox)row.FindControl("chkRemove");
            if (hfSOPId != null || chkCustom != null)
            {
                if (chkDefault.Text == hfSOPId.Value)
                {
                    if (chkCustom.Checked == true)
                    {
                        //Delete Custom SOP and Select Default SOP
                        SOP sop = new SOP();
                        sop.SOPId = int.Parse(chkDefault.Text);
                        ProcessDeleteSOP deleteSOP = new ProcessDeleteSOP();
                        deleteSOP.SOP = sop;
                        deleteSOP.Invoke();
                        chkCustom.Checked = false;
                        grdSOP.DataBind();

                    }
                }
            }
        }
    }
    protected void cmdContinue_Click(object sender, EventArgs e)
    {       
        saveData();
        Response.Redirect("~/ControlPanel/District/SOPReview.aspx?GroupId=" + ddlKitchen.SelectedValue);
                
    }    
    protected void grdSOP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            saveData();
            string strGroupId, strSOPId;
            strSOPId = e.CommandName;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditSOP.aspx?SOPId=" + strSOPId + "&GroupId=" + strGroupId + "&Mode=3");
            Response.Redirect("~/ControlPanel/District/EditSOPIE1.aspx?SOPId=" + strSOPId + "&GroupId=" + strGroupId + "&Mode=3");
           
        }
    }
    protected void btnEditSOPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/SOPGroup.aspx");
    }
    protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    private void saveData()
    {
        CheckBox chkRemove;
        HiddenField hfSOPId;

        foreach (GridViewRow row in grdSOP.Rows)
        {
            chkRemove = (CheckBox)row.FindControl("chkRemove");
            hfSOPId = (HiddenField)row.FindControl("hfSOPId");
            if (chkRemove != null && hfSOPId != null)
            {
                SOP sop = new SOP();
                sop.SOPId = int.Parse(hfSOPId.Value);
                if (chkRemove.Checked == true)
                {
                    sop.Removed = 1;
                }
                else
                {
                    sop.Removed = 0;
                }
                ProcessSetSOP setSop = new ProcessSetSOP();
                setSop.SOP = sop;
                setSop.SOPSelection();
            }
        }
    }
    protected void cmdAdditionalSOP_Click(object sender, EventArgs e)
    {
        saveData();
        string strGroupId;
        strGroupId = ddlKitchen.SelectedValue;
        Response.Redirect("~/ControlPanel/District/EditSOPIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        /////////////////////////////////
        // Check Bowser Type           //
        /////////////////////////////////
        //if (Request.Browser.ToString().ToUpper() == "IE")
        //{
        //    Response.Redirect("~/ControlPanel/District/EditSOPIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
        //else
        //{
        //    Response.Redirect("~/ControlPanel/District/EditSOPIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
    }
    private void SetAdditionalButton()
    {
        if (ddlKitchen.SelectedItem.Text == "USDA DEFAULT SOP" || ddlKitchen.SelectedItem.Text == " -- SELECT VALUE -- ")
        {

            cmdAdditionalSOP.Visible = false;
        }
        else
        {

            cmdAdditionalSOP.Visible = true;
        }
        
    }
}
