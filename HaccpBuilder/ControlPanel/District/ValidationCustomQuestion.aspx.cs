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

public partial class ControlPanel_District_ValidationCustomQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            ddlChecklistGroup.DataBind();
            if (Request.QueryString["GroupId"] != null)
            {
                ddlChecklistGroup.SelectedValue = Request.QueryString["GroupId"].ToString();
            }
            else
            {
                ddlChecklistGroup.SelectedIndex = 0;               
            }
            SetAdditionalButton();
            //GetData();
        }
    }

    protected void btnCreateChecklistGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ValidationGroup.aspx");
    }
    protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    //protected void lkbCreateCustomQuestion_Click(object sender, EventArgs e)
    //{
    //    saveData();
    //    string strGroupId, strSection;
    //    strSection = lblIteration.Text;
    //    strGroupId = ddlChecklistGroup.SelectedValue;
    //    Response.Redirect("~/ControlPanel/District/EditQuestion.aspx?GroupId=" + strGroupId + "&Mode=2" + "&Section=" + strSection);
    //}
    protected void cmdContinue_Click(object sender, EventArgs e)
    {
        saveData();
        //Set value of label for next page
        //lblIteration.Text = (int.Parse(lblIteration.Text) + 1).ToString();
        //if (int.Parse(lblIteration.Text) <= 11)
        //{
        //    GetData();
        //}
        //else
        //{
        Response.Redirect("~/ControlPanel/District/ValidationQuestionReview.aspx?GroupId=" + ddlChecklistGroup.SelectedValue);
        //}


    }
    protected void chkDefault_CheckedChanged(object sender, EventArgs e)
    {

        HiddenField hfQuestionId;
        CheckBox chkDefault, chkCustom;
        chkDefault = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkDefault.NamingContainer;
        if (chkDefault.Checked == true)
        {
            hfQuestionId = (HiddenField)row.FindControl("hfQuestionId");
            chkCustom = (CheckBox)row.FindControl("chkCustom");
            //chkRemove = (CheckBox)row.FindControl("chkRemove");
            if (hfQuestionId != null || chkCustom != null)
            {
                if (chkDefault.Text == hfQuestionId.Value)
                {
                    if (chkCustom.Checked == true)
                    {
                        //Delete Custom Question and Select Default Question
                        ValidationQuestion question = new ValidationQuestion();
                        ProcessDeleteValidationQuestion  deleteQuestion = new ProcessDeleteValidationQuestion();
                        //FoodSafetyQuestion question = new FoodSafetyQuestion();
                        question.QuestionId= int.Parse(chkDefault.Text);
                       // ProcessDeleteFoodSafetQuestion deleteQuestion = new ProcessDeleteFoodSafetQuestion();
                        deleteQuestion.ValidationQuestion = question;
                        deleteQuestion.Invoke();
                        chkCustom.Checked = false;                       
                        //grdQuestion.DataSource = ObjectDataSource1;
                        grdQuestion.DataBind();
                    }
                }
            }
        }

    }
    protected void chkCustom_CheckedChanged(object sender, EventArgs e)
    {

        CheckBox chkCustom = (CheckBox)sender;
        if (chkCustom.Checked == true)
        {
            saveData();
            string strQuestionId, strGroupId, strSection;
            strQuestionId = chkCustom.Text;
            strGroupId = ddlChecklistGroup.SelectedValue;
            //strSection = lblIteration.Text;
            Response.Redirect("~/ControlPanel/District/ValidationEditQuestion.aspx?QuestionId=" + strQuestionId + "&GroupId=" + strGroupId + "&Mode=1");
        }
    }
    public string getCategory(string strSectionId)
    {
        string strSection = "";
        switch (strSectionId)
        {

            case "PA":
                strSection = "Personal Hygiene";
                break;
            case "FP":
                strSection = "Food Preparation";
                break;
            case "HH":
                strSection = "Hot Holding";
                break;
            case "CH":
                strSection = "Cold Holding";
                break;
            case "RFM":
                strSection = "Refrigerator, Freezer, And Milk Cooler";
                break;
            case "FSDS":
                strSection = "Food Storage and Dry Storage";
                break;
            case "CS":
                strSection = "Cleaning and Sanitizing";
                break;
            case "UE":
                strSection = "Utensils and Equipment";
                break;
            case "LE":
                strSection = "Large Equipment";
                break;
            case "GSD":
                strSection = "Garbage Storage and Disposal";
                break;
            case "PC":
                strSection = "Pest Control";
                break;
        }
        return strSection;

    }
    protected void grdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox chkDefault, chkCustom, chkRemove;
        Label lblIsAdditional;
        LinkButton lkbEdit;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label titleLabel = (Label)e.Row.FindControl("lblTitle");
            //HiddenField hfSection = (HiddenField)e.Row.FindControl("hfSection");

            
            //string title = (string)ViewState["title"];
            //if (title == strval)
            //{
            //    titleLabel.Visible = false;
            //    titleLabel.Text = string.Empty;
            //}
            //else
            //{
            //    title = strval;
            //    ViewState["title"] = title;
            //    titleLabel.Visible = true;
            //    titleLabel.Text = getCategory(title);
            //}

            chkDefault = (CheckBox)e.Row.FindControl("chkDefault");
            chkRemove = (CheckBox)e.Row.FindControl("chkRemove");
            chkCustom = (CheckBox)e.Row.FindControl("chkCustom");
            lblIsAdditional = (Label)e.Row.FindControl("lblIsAdditional");
            lkbEdit = (LinkButton)e.Row.FindControl("lkbEditSOP");

            if (chkDefault != null && chkCustom != null && chkRemove != null && lblIsAdditional != null)
            {
                if (ddlChecklistGroup.SelectedItem.Text != "USDA DEFAULT QUESTIONS")
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
    protected void grdQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGroupId, strQuestionId;
            strQuestionId = e.CommandName;
            strGroupId = ddlChecklistGroup.SelectedValue;           
            Response.Redirect("~/ControlPanel/District/ValidationEditQuestion.aspx?QuestionId=" + strQuestionId + "&GroupId=" + strGroupId + "&Mode=3");
        }
    }
    //protected void grdQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    CheckBox chkRemove;
    //    HiddenField hfQuestionId;

    //    foreach (GridViewRow row in grdQuestion.Rows)
    //    {
    //        chkRemove = (CheckBox)row.FindControl("chkRemove");
    //        hfQuestionId = (HiddenField)row.FindControl("hfQuestionId");
    //        if (chkRemove != null && hfQuestionId != null)
    //        {
    //            FoodSafetyQuestion question = new FoodSafetyQuestion();
    //            question.QuestionId = int.Parse(hfQuestionId.Value);
    //            if (chkRemove.Checked == true)
    //            {
    //                question.Active = 0;
    //            }
    //            else
    //            {
    //                question.Active = 1;
    //            }
    //            ProcessSetFoodSafetyQuestion setQuestion = new ProcessSetFoodSafetyQuestion();
    //            setQuestion.FoodSafetyQuestion = question;
    //            setQuestion.FoodSafetyQuestionSelection();
    //        }
    //    }
    //}

    //protected void cmdBack_Click(object sender, ImageClickEventArgs e)
    //{
    //    if (int.Parse(lblIteration.Text) > 1)
    //    {
    //        lblIteration.Text = (int.Parse(lblIteration.Text) - 1).ToString();
    //        GetData();
    //    }

    //}
    private void GetData()
    {
        ViewState["title"] = "";
       
       
        //grdQuestion.DataSource = ObjectDataSource1;
        //grdQuestion.DataBind();

    }
    protected void ddlChecklistGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetAdditionalButton();
        GetData();
    }
    private void saveData()
    {
        CheckBox chkRemove;
        HiddenField hfQuestionId;

        foreach (GridViewRow row in grdQuestion.Rows)
        {
            chkRemove = (CheckBox)row.FindControl("chkRemove");
            hfQuestionId = (HiddenField)row.FindControl("hfQuestionId");
            if (chkRemove != null && hfQuestionId != null)
            {
                ValidationQuestion question = new ValidationQuestion();
               // FoodSafetyQuestion question = new FoodSafetyQuestion();
                question.QuestionId = int.Parse(hfQuestionId.Value);
                if (chkRemove.Checked == true)
                {
                    question.Active = 0;
                }
                else
                {
                    question.Active = 1;
                }
                ProcessSetValidationQuestion setQuestion = new ProcessSetValidationQuestion();
                //ProcessSetFoodSafetyQuestion setQuestion = new ProcessSetFoodSafetyQuestion();
                setQuestion.ValidationQuestion = question;
                setQuestion.ValidationQuestionSelection();
            }
        }
    }

    protected void cmdAdditionalQuestion_Click(object sender, EventArgs e)
    {
        saveData();
        string strGroupId, strSection;
       // strSection = lblIteration.Text;
        strGroupId = ddlChecklistGroup.SelectedValue;
        Response.Redirect("~/ControlPanel/District/ValidationEditQuestion.aspx?GroupId=" + strGroupId + "&Mode=2");
    }
    protected void btnCreateValidationGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ValidationGroup.aspx");
    }
    private void SetAdditionalButton()
    {
        if (ddlChecklistGroup.SelectedItem.Text == "USDA DEFAULT QUESTIONS" || ddlChecklistGroup.SelectedItem.Text == " -- SELECT VALUE -- ")
        {
            //lkbCreateCustomQuestion.Enabled = false;
            cmdAdditionalQuestion.Visible = false;
        }
        else
        {
            //lkbCreateCustomQuestion.Enabled = true;
            cmdAdditionalQuestion.Visible = true;
        }
    }
}
