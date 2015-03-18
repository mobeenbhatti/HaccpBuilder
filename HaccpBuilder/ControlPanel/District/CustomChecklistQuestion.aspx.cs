using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataModel;
namespace HaccpBuilder.ControlPanel.District
{
    public partial class CustomChecklistQuestion : System.Web.UI.Page
    {
        private Entities context = new Entities();
       
       protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
             ddlChecklistSection.DataBind();
             if (Request.QueryString["SectionId"] != null)
             {
                 ddlChecklistSection.SelectedValue = Request.QueryString["SectionId"].ToString();
                 hfGroupId.Value = Request.QueryString["GroupId"];
                 GetData();
             }
             else
             {
                 ddlChecklistSection.SelectedIndex = 0;              
             }            
            SetAdditionalButton();
           
        }
    }

    protected void btnCreateChecklistSection_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CheckListGroup.aspx");
    }
    protected void btnAddKitchens_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    
    protected void cmdContinue_Click(object sender, EventArgs e)
    {       
       // saveData();      
        Response.Redirect("~/ControlPanel/District/CheckListQuestionsReview.aspx?SectionId=" + ddlChecklistSection.SelectedValue + "&GroupId=" + hfGroupId.Value);       
    }    
   
    protected void grdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
    protected void grdQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {       
            if (e.CommandName != "Page")
            {
                GridViewRow row;
                //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                int nTotalRecords = grdQuestion.Rows.Count;
                int nOriginalQuestionId, nNewQuestionId,OriginalSortOrder,NewSortOrder;

                int nQuestionId = int.Parse(e.CommandArgument.ToString());
                if (e.CommandName == "EditQuestion")
                {
                    hfQuestionId.Value = e.CommandArgument.ToString();
                    CheckListQuestion question = (from ad in context.CheckListQuestions
                                                  where ad.ChecklistQuestionId == nQuestionId 
                                                                   select ad).FirstOrDefault();
                    FillForm(question);
                    ModalPopupExtender1.PopupControlID = "divPopup";
                    ModalPopupExtender1.Show();

                }
                if (e.CommandName == "DeleteQuestion")
                {
                    DeleteItem(nQuestionId);
                    GetData();
                }
                if (e.CommandName == "Up" || e.CommandName == "Down")
                {
                    row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    if (e.CommandName == "Up" && (grdQuestion.Rows.Count > 1 && row.RowIndex > 0))
                    {
                        row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                        nOriginalQuestionId = Convert.ToInt32(grdQuestion.DataKeys[row.RowIndex].Value);
                        nNewQuestionId = Convert.ToInt32(grdQuestion.DataKeys[row.RowIndex - 1].Value);

                        var oldQuestion = (from ad in context.CheckListQuestions
                                           where ad.ChecklistQuestionId == nOriginalQuestionId
                                           select ad).FirstOrDefault();
                        OriginalSortOrder = oldQuestion.SortOrder;
                        var newQuestion = (from ad in context.CheckListQuestions
                                           where ad.ChecklistQuestionId == nNewQuestionId
                                           select ad).FirstOrDefault();
                        NewSortOrder = newQuestion.SortOrder;

                        oldQuestion.SortOrder = NewSortOrder;
                        newQuestion.SortOrder = OriginalSortOrder;
                        context.SaveChanges();
                        GetData();
                    }
                    //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                    if (e.CommandName == "Down" && (grdQuestion.Rows.Count > 1 && row.RowIndex < nTotalRecords - 1))
                    {
                        nOriginalQuestionId = Convert.ToInt32(grdQuestion.DataKeys[row.RowIndex].Value);
                        nNewQuestionId = Convert.ToInt32(grdQuestion.DataKeys[row.RowIndex + 1].Value);

                        var oldQuestion = (from ad in context.CheckListQuestions
                                           where ad.ChecklistQuestionId == nOriginalQuestionId
                                           select ad).FirstOrDefault();
                        OriginalSortOrder = oldQuestion.SortOrder;
                        var newQuestion = (from ad in context.CheckListQuestions
                                           where ad.ChecklistQuestionId == nNewQuestionId
                                           select ad).FirstOrDefault();
                        NewSortOrder = newQuestion.SortOrder;

                        oldQuestion.SortOrder = NewSortOrder;
                        newQuestion.SortOrder = OriginalSortOrder;
                        context.SaveChanges();
                        GetData();

                    }
                }
            }        
    }
    
    protected void ddlChecklistSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetAdditionalButton();
        GetData();
    }
    
        protected void cmdAdditionalQuestion_Click(object sender, EventArgs e)
    {
        txtQuestion.Text ="";        
        hfQuestionId.Value = "";
        ModalPopupExtender1.Show();
    }
    protected void cmdGo_Click(object sender, EventArgs e)
    {
        if (hfQuestionId.Value == "")
        {            
            InsertItem();
        }
        else
        {

            UpdateItem(int.Parse(hfQuestionId.Value));
        }
        GetData();
        
    }
    private void SetAdditionalButton()
    {
        if (ddlChecklistSection.SelectedItem.Text == "USDA DEFAULT QUESTIONS" || ddlChecklistSection.SelectedItem.Text == " -- SELECT VALUE -- ")
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

   
#region Methods

    private void GetData()
    {
        int nSectionId = int.Parse(ddlChecklistSection.SelectedValue);
        int nGroupId = int.Parse(hfGroupId.Value);
        List<CheckListQuestion> details = (from dt in context.CheckListQuestions
                                                    where dt.CheckListSectionId == nSectionId && dt.ChecklistGroupId == nGroupId && dt.Deleted == 0
                                                    orderby dt.SortOrder
                                                    select dt).ToList();
        grdQuestion.DataSource = details;
        grdQuestion.DataBind();              
    }
    private void InsertItem()
    {
        int maxSort = 1;
        CheckListQuestion question = new CheckListQuestion();
        GetFormValues(question);
        question.CreatedDate = DateTime.Now;
        question.ModiefiedDate = DateTime.Now;
        var Sort = from qs in context.CheckListQuestions                   
                   select qs.SortOrder;
        if (Sort.Count() > 0)
        {
            maxSort = (int)Sort.Max() + 1;
        }
        else
        {
            maxSort = 1;
        }
        question.SortOrder = maxSort;
        context.CheckListQuestions.AddObject(question);
        context.SaveChanges();

    }
    private void GetFormValues(CheckListQuestion question)
    {

        question.Checklist = txtQuestion.Text;
        question.BoolActive = chkBoolean.Checked == true ? 1 : 0;
        question.OFActive = chkOpenField.Checked == true ? 1 : 0;
        question.CAActive = chkCorrectiveAction.Checked == true ? 1 : 0;
        question.Active = chkActive.Checked == true ? 1 : 0;
        question.CheckListSectionId = int.Parse(ddlChecklistSection.SelectedValue);
        question.ChecklistGroupId = int.Parse(hfGroupId.Value);
        question.ModiefiedDate = DateTime.Now;
        question.OfRequired = chkOpenRequired.Checked == true ? 1 : 0;
        
       // question.ChecklistQuestionId = int.Parse(hfQuestionId.Value);
    }
    private void FillForm(CheckListQuestion question)
    {
        txtQuestion.Text = question.Checklist;
        chkBoolean.Checked = question.BoolActive == 1 ? true : false;
        chkOpenField.Checked = question.OFActive == 1 ? true : false;
        chkCorrectiveAction.Checked = question.CAActive == 1 ? true : false;
        chkActive.Checked = question.Active == 1 ? true : false;
        chkOpenRequired.Checked = question.OfRequired == 1 ? true : false;
        hfQuestionId.Value = question.ChecklistQuestionId.ToString();
        
    }
    private void UpdateItem(int nQuestionId)
    {
        CheckListQuestion question = (from ad in context.CheckListQuestions
                                                     where ad.ChecklistQuestionId == nQuestionId
                                                     select ad).FirstOrDefault();
        GetFormValues(question);
        context.SaveChanges();
    }
    private void DeleteItem(int nQuestionId)
    {
        CheckListQuestion question = (from ad in context.CheckListQuestions
                                      where ad.ChecklistQuestionId == nQuestionId
                                      select ad).FirstOrDefault();
        question.Deleted = 1;
        //context.CheckListQuestions.DeleteObject(question);
        context.SaveChanges();

    }
    
#endregion
    
    }
}