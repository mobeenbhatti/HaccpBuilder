using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;
namespace HaccpBuilder.ControlPanel.District
{
    public partial class KitchenChecklistReview : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();

        }
        public void GetData()
        {
            var questions = (from qs in context.CheckListQuestions
                             join rs in context.CheckListResponses
                             on qs.ChecklistQuestionId equals rs.CheckListQuestionId
                             join rh in context.ChecklistHistories
                             on rs.ChecklistHistoryId equals rh.ChecklistHistoryId
                             join ca in context.CheckListCorrectiveActions
                             on rs.CAResponse equals ca.CorrectiveActionId into rsca
                             from ca in rsca.DefaultIfEmpty()
                             where qs.Active == 1 && rh.ChecklistHistoryId == HistoryId
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
            }
            ChecklistSection sectionDetail = (from sc in context.ChecklistSections
                                              where sc.CheckListSectionId == history.ChecklistSectionId
                                              select sc).FirstOrDefault();
            if (sectionDetail != null)
            {
                lblSection.Text = sectionDetail.Name;
            }
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