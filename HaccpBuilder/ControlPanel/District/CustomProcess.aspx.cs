using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;


public partial class ControlPanel_District_CustomProcess : System.Web.UI.Page
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
    protected void grdProcess_RowDataBound(object sender, GridViewRowEventArgs e)
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
            lkbEdit = (LinkButton)e.Row.FindControl("lkbEditProcess");

            if (chkDefault != null && chkCustom != null && chkRemove != null && lblIsAdditional != null)
            {
                if (ddlKitchen.SelectedItem.Text != "USDA DEFAULT PROCESS")
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
        // Create New Custom Process based on Default Process
        CheckBox chkCustom = (CheckBox)sender;
        if (chkCustom.Checked == true)
        {
            saveData();
            string strProcessId, strGroupId;
            strProcessId = chkCustom.Text;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditProcess.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=1");
            Response.Redirect("~/ControlPanel/District/EditProcess.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=1");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.Browser.ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditProcessIE.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=1");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditProcess1.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=1");
            //}

        }
        else
        {
        }
    }
    protected void chkDefault_CheckedChanged(object sender, EventArgs e)
    {

        HiddenField hfProcessId;
        CheckBox chkDefault, chkCustom;
        chkDefault = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkDefault.NamingContainer;
        if (chkDefault.Checked == true)
        {
            hfProcessId = (HiddenField)row.FindControl("hfProcessId");
            chkCustom = (CheckBox)row.FindControl("chkCustom");
            //chkRemove = (CheckBox)row.FindControl("chkRemove");
            if (hfProcessId != null || chkCustom != null)
            {
                if (chkDefault.Text == hfProcessId.Value)
                {
                    if (chkCustom.Checked == true)
                    {
                        //Delete Custom Process and Select Default Process
                        Processes Process = new Processes();
                        Process.ProcessId = int.Parse(chkDefault.Text);
                        ProcessDeleteProcess deleteProcess = new ProcessDeleteProcess();
                        deleteProcess.Process = Process;
                        deleteProcess.Invoke();
                        chkCustom.Checked = false;
                        grdProcess.DataBind();

                    }
                }
            }
        }
    }
    protected void cmdContinue_Click(object sender, EventArgs e)
    {
        //CheckBox chkRemove;
        //HiddenField hfProcessId;

        //foreach (GridViewRow row in grdProcess.Rows)
        //{
        //    chkRemove = (CheckBox)row.FindControl("chkRemove");
        //    hfProcessId = (HiddenField)row.FindControl("hfProcessId");
        //    if (chkRemove != null && hfProcessId != null)
        //    {
        //        Process Process = new Process();
        //        Process.ProcessId = int.Parse(hfProcessId.Value);
        //        if (chkRemove.Checked == true)
        //        {
        //            Process.Removed = 1;
        //        }
        //        else
        //        {
        //            Process.Removed = 0;
        //        }
        //        ProcessSetProcess setProcess = new ProcessSetProcess();
        //        setProcess.Process = Process;
        //        setProcess.ProcessSelection();
        //    }
        //}
        saveData();
        Response.Redirect("~/ControlPanel/District/ProcessReview.aspx?GroupId=" + ddlKitchen.SelectedValue);


    }
    protected void grdProcess_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGroupId, strProcessId;
            strProcessId = e.CommandName;
            strGroupId = ddlKitchen.SelectedValue;
            //Response.Redirect("~/ControlPanel/District/EditProcess.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=3");
            Response.Redirect("~/ControlPanel/District/EditProcess.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=3");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.Browser.ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditProcessIE1.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=3");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditProcessIE1.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=3");
            //}
        }
    }
    protected void btnEditProcessGroup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ProcessGroup.aspx");
    }
    protected void btnAddKitchens_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    private void saveData()
    {
        CheckBox chkRemove;
        HiddenField hfProcessId;

        foreach (GridViewRow row in grdProcess.Rows)
        {
            chkRemove = (CheckBox)row.FindControl("chkRemove");
            hfProcessId = (HiddenField)row.FindControl("hfProcessId");
            if (chkRemove != null && hfProcessId != null)
            {
                Processes Process = new Processes();
                Process.ProcessId = int.Parse(hfProcessId.Value);
                if (chkRemove.Checked == true)
                {
                    Process.Active = 0;
                }
                else
                {
                    Process.Active = 1;
                }
                ProcessSetProcess setProcess = new ProcessSetProcess();
                setProcess.Process = Process;
                setProcess.ProcessSelection();
            }
        }
    }
    protected void cmdAdditionalProcess_Click(object sender, EventArgs e)
    {
        saveData();
        string strGroupId;
        strGroupId = ddlKitchen.SelectedValue;
        Response.Redirect("~/ControlPanel/District/EditProcess.aspx?GroupId=" + strGroupId + "&Mode=2");
        /////////////////////////////////
        // Check Bowser Type           //
        /////////////////////////////////
        //if (Request.Browser.ToString().ToUpper() == "IE")
        //{
        //    Response.Redirect("~/ControlPanel/District/EditProcessIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
        //else
        //{
        //    Response.Redirect("~/ControlPanel/District/EditProcessIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
        //}
    }
    protected void chkRemove_CheckedChanged(object sender, EventArgs e)
    {

    }
    private void SetAdditionalButton()
    {
        if (ddlKitchen.SelectedItem.Text == "USDA DEFAULT PROCESS" || ddlKitchen.SelectedItem.Text == " -- SELECT VALUE -- ")
        {

            cmdAdditionalProcess.Visible = false;
        }
        else
        {

            cmdAdditionalProcess.Visible = true;
        }        
    }
}
