using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class checklistQuestionReviewNew : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack != true)
            {
                GetData();
            }

        }
        public void GetData()
        {
            //int HistoryId = (from rh in context.ChecklistHistories
            //                 where rh.EntryDate == EntryDate && rh.ChecklistSectionId == SectionId
            //                 select rh.ChecklistHistoryId).FirstOrDefault();

            var questions = (from qs in context.CheckListQuestions
                             join rs in context.CheckListResponses
                             on qs.ChecklistQuestionId equals rs.CheckListQuestionId
                             join rh in context.ChecklistHistories
                             on rs.ChecklistHistoryId equals rh.ChecklistHistoryId
                             join ca in context.CheckListCorrectiveActions
                             on rs.CAResponse equals ca.CorrectiveActionId into rsca
                             from ca in rsca.DefaultIfEmpty()
                             where qs.Active == 1 
                             && rh.ChecklistHistoryId == HistoryId
                             select new { qs.Checklist, qs.ChecklistQuestionId, rs.BoolResponse, rs.CAResponse, rs.OFResponse, CorrectiveAction = (ca == null ? String.Empty : ca.CorrectiveAction) }).ToList();


            if (questions != null)
            {
                grdChecklist.DataSource = questions;
                grdChecklist.DataBind();
            }

            ChecklistHistory history = (from hs in context.ChecklistHistories
                                        where hs.ChecklistHistoryId == HistoryId
                                        select hs).FirstOrDefault();
            if (history != null)
            {
                lblObserverValue.Text = history.Observer;
                lblEntryDate.Text = history.EntryDate.ToShortDateString();

                ChecklistSection sectionDetail = (from sc in context.ChecklistSections
                                                  where sc.CheckListSectionId == history.ChecklistSectionId
                                                  select sc).FirstOrDefault();
                if (sectionDetail != null)
                {
                    lblSection.Text = sectionDetail.Name;
                }
            }
            else
            {
                lblError.Text = "No Data Found";
                lblError.Visible = true;
            }
        }

        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
        }

        #region Properties

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
        int HistoryId
        {
            get
            {
                if (Request.QueryString["HistoryId"] != null)
                    return int.Parse(Request.QueryString["HistoryId"]);
                else
                    if (Request.QueryString["SectionId"] != null)
                    {
                        int nHistoryId = (from rh in context.ChecklistHistories
                                          where rh.EntryDate == EntryDate && rh.ChecklistSectionId == SectionId
                                          select rh.ChecklistHistoryId).FirstOrDefault();
                        return nHistoryId;
                    }
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
        int KitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                    return 1;
            }
        }
        #endregion
    }
}