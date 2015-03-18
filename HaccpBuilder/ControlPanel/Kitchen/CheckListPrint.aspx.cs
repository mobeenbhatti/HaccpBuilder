using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class ChecklistPrintNew : System.Web.UI.Page
    {

        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<CheckListQuestion> questions = (from p in context.CheckListQuestions
                                                     where p.CheckListSectionId == SectionId && p.Active == 1 && p.Deleted == 0
                                                     orderby p.SortOrder
                                                     select p).ToList();
                if (questions != null)
                {
                    grdChecklist.DataSource = questions;
                    grdChecklist.DataBind();
                }
                ChecklistSection sectionDetail = (from sc in context.ChecklistSections
                                                  where sc.CheckListSectionId == SectionId
                                                  select sc).FirstOrDefault();
                if (sectionDetail != null)
                {
                    lblSection.Text = sectionDetail.Name;
                }
            }
        }
        protected void grdChecklist_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButton rdbAnswerNo = (RadioButton)e.Row.FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)e.Row.FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)e.Row.FindControl("rdbAnswerNA");
                TextBox txtAnswer = (TextBox)e.Row.FindControl("txtCorrectiveAction");
                RadioButtonList rdlCorrectiveAction = (RadioButtonList)e.Row.FindControl("rdlCorrectiveActions");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Row.FindControl("vldAnswerValidate");
                RequiredFieldValidator vldCorrectiveAction = (RequiredFieldValidator)e.Row.FindControl("vldCorrectiveAction");
                HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction, hfOfRequired;

                hfQuestionId = (HiddenField)e.Row.FindControl("hfQuestionId");
                hfBoolActive = (HiddenField)e.Row.FindControl("hfIsBoolActive");
                hfOpenActive = (HiddenField)e.Row.FindControl("hfIsOpenActive");
                hfOfRequired = (HiddenField)e.Row.FindControl("hfOfRequired");
                hfCorrectiveAction = (HiddenField)e.Row.FindControl("hfIsCorrectiveAction");
                int nQuestionId = int.Parse(hfQuestionId.Value);
                // Change at 12-11-08
                if (hfBoolActive.Value != "1")
                {
                    rdbAnswerNo.Visible = false;
                    rdbAnswerYes.Visible = false;
                    rdbAnswerNA.Visible = false;


                }
                if (hfOpenActive.Value != "1")
                {
                    txtAnswer.Visible = false;

                }
                if (hfOfRequired.Value != "1")
                {
                    vldAnswerValidate.Enabled = false;
                }
                if (hfCorrectiveAction.Value != "1")
                {
                    rdlCorrectiveAction.Visible = false;
                    vldCorrectiveAction.Enabled = false;
                }
                else
                {
                    List<CheckListCorrectiveAction> actions = (from q in context.CheckListCorrectiveActions
                                                               where q.CheckListQuestionId == nQuestionId
                                                               select q).ToList();
                    if (actions != null)
                    {
                        rdlCorrectiveAction.DataSource = actions;
                        rdlCorrectiveAction.DataTextField = "CorrectiveAction";
                        rdlCorrectiveAction.DataValueField = "CorrectiveActionId";
                        rdlCorrectiveAction.DataBind();
                    }
                }

                if (rdbAnswerNo != null && txtAnswer != null)
                {
                    rdbAnswerNo.Attributes.Add("onclick", "check(" + vldCorrectiveAction.ClientID + ",true)");
                }
                if (rdbAnswerYes != null)
                {
                    rdbAnswerYes.Attributes.Add("onclick", "check(" + vldCorrectiveAction.ClientID + ", false)");
                }
                if (rdbAnswerNA != null)
                {
                    rdbAnswerNA.Attributes.Add("onclick", "check(" + vldCorrectiveAction.ClientID + ", false)");
                }
            }
        }
        int SectionId
        {
            get
            {
                if (Request.QueryString["SectionId"] != null)
                    return int.Parse(Request.QueryString["SectionId"]);
                else
                    return 1;
            }

        }
    }
    
}