using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;
using SchoolHaccp.Operational;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class ChecklistQuestion : System.Web.UI.Page
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
                    //grdChecklist.DataSource = questions;
                    //grdChecklist.DataBind();

                    rptChecklist.DataSource = questions;
                    rptChecklist.DataBind();
                }
                ChecklistSection sectionDetail = (from sc in context.ChecklistSections
                                                  where sc.CheckListSectionId == SectionId
                                                  select sc).FirstOrDefault();
                if (sectionDetail != null)
                {
                    lblSection.Text = sectionDetail.Name + " - Total Questions: " + rptChecklist.Items.Count.ToString();
                }
               // txtObserver.Text = Session["Initials"].ToString();
                LoadResponses();
            }
        }
        protected void rptChecklist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButton rdbAnswerNo = (RadioButton)e.Item.FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)e.Item.FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)e.Item.FindControl("rdbAnswerNA");
                TextBox txtAnswer = (TextBox)e.Item.FindControl("txtCorrectiveAction");
                RadioButtonList rdlCorrectiveAction = (RadioButtonList)e.Item.FindControl("rdlCorrectiveActions");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Item.FindControl("vldAnswerValidate");
                RequiredFieldValidator vldCorrectiveAction = (RequiredFieldValidator)e.Item.FindControl("vldCorrectiveAction");
                HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction, hfOfRequired;

                hfQuestionId = (HiddenField)e.Item.FindControl("hfQuestionId");
                hfBoolActive = (HiddenField)e.Item.FindControl("hfIsBoolActive");
                hfOpenActive = (HiddenField)e.Item.FindControl("hfIsOpenActive");
                hfCorrectiveAction = (HiddenField)e.Item.FindControl("hfIsCorrectiveAction");
                hfOfRequired = (HiddenField)e.Item.FindControl("hfOfRequired");
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
                HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction;

                hfQuestionId = (HiddenField)e.Row.FindControl("hfQuestionId");
                hfBoolActive = (HiddenField)e.Row.FindControl("hfIsBoolActive");
                hfOpenActive = (HiddenField)e.Row.FindControl("hfIsOpenActive");
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
                    rdbAnswerNo.Attributes.Add("onclick", "check(" + txtAnswer.ClientID + "," + vldAnswerValidate.ClientID + ",true)");
                }
                if (rdbAnswerYes != null)
                {
                    rdbAnswerYes.Attributes.Add("onclick", "check(" + txtAnswer.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }
            }
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            SaveResponses();
            Response.Redirect("~/ControlPanel/Location/ChecklistQuestionReview.aspx?HistoryId=" + hfHistoryId.Value);
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Location/Default.aspx");
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
        int nMobileId
        {
            get
            {
                if (Session["MobileId"] != null)
                    return (int)Session["MobileId"];
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
            totalItems = rptChecklist.Items.Count;

            ChecklistHistory responseHistory;
            responseHistory = CheckResponseExist();
            if (responseHistory == null)
            {
                responseHistory = new ChecklistHistory();
                responseHistory.AccountId = nMobileId;
                responseHistory.AccountType = 2;
                responseHistory.EntryDate = DateTime.Now;
                responseHistory.IsComplete = 1;
                responseHistory.Observer = txtObserver.Text;
                responseHistory.ChecklistSectionId = SectionId;
                responseHistory.MobileID = nMobileId;
                context.ChecklistHistories.AddObject(responseHistory);
                context.SaveChanges();
                mode = "new";
            }
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNA");
                TextBox txtAnswer = (TextBox)rptChecklist.Items[i].FindControl("txtCorrectiveAction");
                RadioButtonList rdlCorrectiveAction = (RadioButtonList)rptChecklist.Items[i].FindControl("rdlCorrectiveActions");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)rptChecklist.Items[i].FindControl("vldAnswerValidate");
                RequiredFieldValidator vldCorrectiveAction = (RequiredFieldValidator)rptChecklist.Items[i].FindControl("vldCorrectiveAction");
                HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction;

                hfQuestionId = (HiddenField)rptChecklist.Items[i].FindControl("hfQuestionId");
                hfBoolActive = (HiddenField)rptChecklist.Items[i].FindControl("hfIsBoolActive");
                hfOpenActive = (HiddenField)rptChecklist.Items[i].FindControl("hfIsOpenActive");
                hfCorrectiveAction = (HiddenField)rptChecklist.Items[i].FindControl("hfIsCorrectiveAction");

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
                        RadioButton rdbAnswerNo = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNo");
                        RadioButton rdbAnswerYes = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerYes");
                        RadioButton rdbAnswerNA = (RadioButton)rptChecklist.Items[i].FindControl("rdbAnswerNA");
                        TextBox txtAnswer = (TextBox)rptChecklist.Items[i].FindControl("txtCorrectiveAction");
                        RadioButtonList rdlCorrectiveAction = (RadioButtonList)rptChecklist.Items[i].FindControl("rdlCorrectiveActions");
                        RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)rptChecklist.Items[i].FindControl("vldAnswerValidate");
                        RequiredFieldValidator vldCorrectiveAction = (RequiredFieldValidator)rptChecklist.Items[i].FindControl("vldCorrectiveAction");
                        HiddenField hfQuestionId, hfBoolActive, hfOpenActive, hfCorrectiveAction, hfChecklisthistory;

                        hfQuestionId = (HiddenField)rptChecklist.Items[i].FindControl("hfQuestionId");
                        hfBoolActive = (HiddenField)rptChecklist.Items[i].FindControl("hfIsBoolActive");
                        hfOpenActive = (HiddenField)rptChecklist.Items[i].FindControl("hfIsOpenActive");
                        hfCorrectiveAction = (HiddenField)rptChecklist.Items[i].FindControl("hfIsCorrectiveAction");
                        hfChecklisthistory = (HiddenField)rptChecklist.Items[i].FindControl("hfChecklisthistory");
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