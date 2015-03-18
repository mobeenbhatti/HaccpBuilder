using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
namespace HaccpBuilder.ControlPanel.District
{
    public partial class CustomCtpat : System.Web.UI.Page
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
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
        }
        protected void ddlKitchen_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetAdditionalButton();
        }
        protected void grdCtpat_RowDataBound(object sender, GridViewRowEventArgs e)
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
                lkbEdit = (LinkButton)e.Row.FindControl("lkbEditCtpat");

                if (chkDefault != null && chkCustom != null && chkRemove != null && lblIsAdditional != null)
                {
                    if (ddlKitchen.SelectedItem.Text != "DEFAULT CTPAT")
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
            // Create New Custom Ctpat based on Default Ctpat
            CheckBox chkCustom = (CheckBox)sender;
            if (chkCustom.Checked == true)
            {
                saveData();
                string strCtpatId, strGroupId;
                strCtpatId = chkCustom.Text;
                strGroupId = ddlKitchen.SelectedValue;
                Response.Redirect("~/ControlPanel/District/EditCtpat.aspx?CtpatId=" + strCtpatId + "&GroupId=" + strGroupId + "&Mode=1");

            }
        }
        protected void chkDefault_CheckedChanged(object sender, EventArgs e)
        {

            HiddenField hfCtpatId;
            CheckBox chkDefault, chkCustom;
            chkDefault = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chkDefault.NamingContainer;
            if (chkDefault.Checked == true)
            {
                hfCtpatId = (HiddenField)row.FindControl("hfCtpatId");
                chkCustom = (CheckBox)row.FindControl("chkCustom");
                //chkRemove = (CheckBox)row.FindControl("chkRemove");
                if (hfCtpatId != null || chkCustom != null)
                {
                    if (chkDefault.Text == hfCtpatId.Value)
                    {
                        if (chkCustom.Checked == true)
                        {
                            //Delete Custom Ctpat and Select Default Ctpat
                            Ctpat Ctpat = new Ctpat();
                            Ctpat.CtpatId = int.Parse(chkDefault.Text);
                            ProcessDeleteCtpat deleteCtpat = new ProcessDeleteCtpat();
                            deleteCtpat.Ctpat = Ctpat;
                            deleteCtpat.Invoke();
                            chkCustom.Checked = false;
                            grdCtpat.DataBind();

                        }
                    }
                }
            }
        }
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            saveData();
            Response.Redirect("~/ControlPanel/District/CtpatReview.aspx?GroupId=" + ddlKitchen.SelectedValue);

        }
        protected void grdCtpat_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                saveData();
                string strGroupId, strCtpatId;
                strCtpatId = e.CommandName;
                strGroupId = ddlKitchen.SelectedValue;
                //Response.Redirect("~/ControlPanel/District/EditCtpat.aspx?CtpatId=" + strCtpatId + "&GroupId=" + strGroupId + "&Mode=3");
                Response.Redirect("~/ControlPanel/District/EditCtpat.aspx?CtpatId=" + strCtpatId + "&GroupId=" + strGroupId + "&Mode=3");

            }
        }
        protected void btnEditCtpatGroup_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/CtpatGroup.aspx");
        }
        protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
        }
        private void saveData()
        {
            CheckBox chkRemove;
            HiddenField hfCtpatId;

            foreach (GridViewRow row in grdCtpat.Rows)
            {
                chkRemove = (CheckBox)row.FindControl("chkRemove");
                hfCtpatId = (HiddenField)row.FindControl("hfCtpatId");
                if (chkRemove != null && hfCtpatId != null)
                {
                    Ctpat Ctpat = new Ctpat();
                    Ctpat.CtpatId = int.Parse(hfCtpatId.Value);
                    if (chkRemove.Checked == true)
                    {
                        Ctpat.Removed = 1;
                    }
                    else
                    {
                        Ctpat.Removed = 0;
                    }
                    ProcessSetCtpat setCtpat = new ProcessSetCtpat();
                    setCtpat.Ctpat = Ctpat;
                    setCtpat.CtpatSelection();
                }
            }
        }
        protected void cmdAdditionalCtpat_Click(object sender, EventArgs e)
        {
            saveData();
            string strGroupId;
            strGroupId = ddlKitchen.SelectedValue;
            Response.Redirect("~/ControlPanel/District/EditCtpat.aspx?GroupId=" + strGroupId + "&Mode=2");
            /////////////////////////////////
            // Check Bowser Type           //
            /////////////////////////////////
            //if (Request.Browser.ToString().ToUpper() == "IE")
            //{
            //    Response.Redirect("~/ControlPanel/District/EditCtpatIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
            //}
            //else
            //{
            //    Response.Redirect("~/ControlPanel/District/EditCtpatIE1.aspx?GroupId=" + strGroupId + "&Mode=2");
            //}
        }
        private void SetAdditionalButton()
        {
            if (ddlKitchen.SelectedItem.Text == "DEFAULT CTPAT" || ddlKitchen.SelectedItem.Text == " -- SELECT VALUE -- ")
            {

                cmdAdditionalCtpat.Visible = false;
            }
            else
            {

                cmdAdditionalCtpat.Visible = true;
            }

        }
    }
}