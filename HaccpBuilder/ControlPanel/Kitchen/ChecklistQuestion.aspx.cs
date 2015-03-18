using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;
using SchoolHaccp.Operational;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class ChecklistQuestionNew : System.Web.UI.Page
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
                LoadResponses();
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
                //if (hfOfRequired.Value != "1")
                //{
                //    vldAnswerValidate.Enabled = false;
                //}
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
                    rdbAnswerNo.Attributes.Add("onclick", "check(" + vldCorrectiveAction.ClientID + ",true," + vldAnswerValidate.ClientID + "," + hfOfRequired.Value + ")");
                }
                if (rdbAnswerYes != null)
                {
                    rdbAnswerYes.Attributes.Add("onclick", "check(" + vldCorrectiveAction.ClientID + ", false," + vldAnswerValidate.ClientID + "," + hfOfRequired.Value + ")");
                }
                if (rdbAnswerNA != null)
                {
                    rdbAnswerNA.Attributes.Add("onclick", "check(" + vldCorrectiveAction.ClientID + ", false," + vldAnswerValidate.ClientID + "," + hfOfRequired.Value + ")");
                }
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            SaveResponses();
            Response.Redirect("~/ControlPanel/Kitchen/ChecklistQuestionReview.aspx?HistoryId=" + hfHistoryId.Value);
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
        }

        #region Properties
        private string mode;
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
        DateTime EntryDate
        {
            get
            {
                if (Request.QueryString["Date"] != null)
                    return DateTime.Parse(Request.QueryString["Date"]);
                else
                    return DateTime.Today;
            }
        }
        int nKitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                    return 1;
            }
        }
        int IsEditMode
        {
            get
            {
                if (Request.QueryString["Edit"] != null)
                    return 1;
                else
                    return 0;
            }
        }
        int HistoryId
        {
            get
            {
                if (Request.QueryString["HistoryId"] != null)
                    return int.Parse(Request.QueryString["HistoryId"]);
                else
                    return 0;
            }
        }

        #endregion

        #region Methods
        private void SaveResponses()
        {
            int i, totalItems;
            totalItems = grdChecklist.Rows.Count;

            ChecklistHistory responseHistory;
            responseHistory = CheckResponseExist();
            if (responseHistory == null)
            {
                responseHistory = new ChecklistHistory();
                responseHistory.AccountId = nKitchenId;
                responseHistory.AccountType = 1;
                responseHistory.EntryDate = DateTime.Now;
                responseHistory.IsComplete = 1;
                responseHistory.Observer = txtObserver.Text;
                responseHistory.ChecklistSectionId = SectionId;

                context.ChecklistHistories.AddObject(responseHistory);
                context.SaveChanges();
                mode = "new";
            }
            {
                responseHistory.Observer = txtObserver.Text;
            }
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerNo = (RadioButton)grdChecklist.Rows[i].FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)grdChecklist.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)grdChecklist.Rows[i].FindControl("rdbAnswerNA");
                TextBox txtAnswer = (TextBox)grdChecklist.Rows[i].FindControl("txtCorrectiveAction");
                RadioButtonList rdlCorrectiveAction = (RadioButtonList)grdChecklist.Rows[i].FindControl("rdlCorrectiveActions");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)grdChecklist.Rows[i].FindControl("vldAnswerValidate");
                RequiredFieldValidator vldCorrectiveAction = (RequiredFieldValidator)grdChecklist.Rows[i].FindControl("vldCorrectiveAction");
                HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction;

                hfQuestionId = (HiddenField)grdChecklist.Rows[i].FindControl("hfQuestionId");
                hfBoolActive = (HiddenField)grdChecklist.Rows[i].FindControl("hfIsBoolActive");
                hfOpenActive = (HiddenField)grdChecklist.Rows[i].FindControl("hfIsOpenActive");
                hfCorrectiveAction = (HiddenField)grdChecklist.Rows[i].FindControl("hfIsCorrectiveAction");

                int nHistoryId, nQuestiondId;
                nHistoryId = responseHistory.ChecklistHistoryId;
                hfHistoryId.Value = responseHistory.ChecklistHistoryId.ToString();
                nQuestiondId = int.Parse(hfQuestionId.Value);
                CheckListResponse userResponse;
                if (mode == "new")
                {
                    userResponse = new CheckListResponse();
                }
                else
                {
                    userResponse = (from resp in context.CheckListResponses
                                    where resp.CheckListQuestionId == nQuestiondId && resp.ChecklistHistoryId == nHistoryId
                                    select resp).FirstOrDefault();
                }

                userResponse.CheckListQuestionId = int.Parse(hfQuestionId.Value);
                if (hfBoolActive.Value == "1")
                {
                    userResponse.BoolResponse = rdbAnswerYes.Checked == true ? 1 : rdbAnswerNo.Checked == true ? 0 : 2;
                }
                if (hfOpenActive.Value == "1")
                {
                    userResponse.OFResponse = txtAnswer.Text;
                }
                if (hfCorrectiveAction.Value == "1")
                {
                    if (rdlCorrectiveAction.Items.Count > 0 && rdlCorrectiveAction.SelectedValue != "")
                        userResponse.CAResponse = int.Parse(rdlCorrectiveAction.SelectedValue);
                }
                userResponse.ChecklistHistoryId = responseHistory.ChecklistHistoryId;
                if (mode == "new")
                    context.CheckListResponses.AddObject(userResponse);

                context.SaveChanges();
            }
        }
        private void LoadResponses()
        {
            if (IsEditMode == 1)
            {
                ChecklistHistory history = CheckResponseExist();
                if (history != null)
                {
                    // Check if EntryDate is older then 24 hours or not. If date is older then 24 hours then Set Mode= Edit
                    txtObserver.Text = history.Observer;
                    lblEntryDate.Text = history.EntryDate.ToShortDateString();
                    List<CheckListResponse> responses = (from rp in context.CheckListResponses
                                                         where rp.ChecklistHistoryId == history.ChecklistHistoryId
                                                         select rp).ToList();
                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(history.EntryDate)) == false)
                    {
                        mode = "view";
                    }
                    else
                    {
                        mode = "edit";
                    }
                    int i = 0;
                    foreach (CheckListResponse userResponse in responses)
                    {
                        RadioButton rdbAnswerNo = (RadioButton)grdChecklist.Rows[i].FindControl("rdbAnswerNo");
                        RadioButton rdbAnswerYes = (RadioButton)grdChecklist.Rows[i].FindControl("rdbAnswerYes");
                        RadioButton rdbAnswerNA = (RadioButton)grdChecklist.Rows[i].FindControl("rdbAnswerNA");
                        TextBox txtAnswer = (TextBox)grdChecklist.Rows[i].FindControl("txtCorrectiveAction");
                        RadioButtonList rdlCorrectiveAction = (RadioButtonList)grdChecklist.Rows[i].FindControl("rdlCorrectiveActions");
                        RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)grdChecklist.Rows[i].FindControl("vldAnswerValidate");
                        RequiredFieldValidator vldCorrectiveAction = (RequiredFieldValidator)grdChecklist.Rows[i].FindControl("vldCorrectiveAction");
                        HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction, hfChecklisthistory;

                        hfQuestionId = (HiddenField)grdChecklist.Rows[i].FindControl("hfQuestionId");
                        hfBoolActive = (HiddenField)grdChecklist.Rows[i].FindControl("hfIsBoolActive");
                        hfOpenActive = (HiddenField)grdChecklist.Rows[i].FindControl("hfIsOpenActive");
                        hfCorrectiveAction = (HiddenField)grdChecklist.Rows[i].FindControl("hfIsCorrectiveAction");
                        hfChecklisthistory = (HiddenField)grdChecklist.Rows[i].FindControl("hfChecklisthistory");
                        if (hfBoolActive.Value == "1")
                        {
                            if (userResponse.BoolResponse == 1)
                                rdbAnswerYes.Checked = true;
                            else if (userResponse.BoolResponse == 0)
                                rdbAnswerNo.Checked = true;
                            else
                                rdbAnswerNA.Checked = true;
                        }
                        if (hfOpenActive.Value == "1")
                        {
                            txtAnswer.Text = userResponse.OFResponse;
                        }
                        if (hfCorrectiveAction.Value == "1")
                        {
                            for (int j = 0; j < rdlCorrectiveAction.Items.Count; j++)
                            {
                                if (rdlCorrectiveAction.Items[j].Value == userResponse.CAResponse.ToString())
                                {
                                    rdlCorrectiveAction.Items[j].Selected = true;
                                    break;
                                }
                            }
                        }
                        hfChecklisthistory.Value = userResponse.ChecklistHistoryId.ToString();
                        if (mode == "view")
                        {
                            rdbAnswerNA.Enabled = false;
                            rdbAnswerNo.Enabled = false;
                            rdbAnswerYes.Enabled = false;
                            txtAnswer.Enabled = false;
                            txtObserver.Enabled = false;
                            rdlCorrectiveAction.Enabled = false;
                        }
                        i++;
                    }
                }
            }

            else
            {
                mode = "new";
            }
        }
        private ChecklistHistory CheckResponseExist()
        {

            ChecklistHistory history = (from ch in context.ChecklistHistories
                                        where ch.ChecklistHistoryId == HistoryId
                                        select ch).FirstOrDefault();
            return history;
        }
        #endregion
    }
}