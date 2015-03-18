using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using System.Data;
using System.Web.Services;

namespace HaccpBuilder.ControlPanel.District
{
    public partial class CorrectiveActionReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["KitchenId"] != null)
                {
                    ddlKitchenName.DataBind();
                    ddlKitchenName.SelectedValue = Request.QueryString["KitchenId"];
                    BindData();
                }
            }
        }
        protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
        {
            BindData();
        }
        protected void grdReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void grdReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdReport.PageIndex = e.NewPageIndex;
            BindData();
           
        }
        private void BindData()
        {
            int kitchenId = int.Parse(ddlKitchenName.SelectedValue);
            DateTime startDate = cldStartDate.SelectedDate;
            DateTime endDate = cldEndDate.SelectedDate;
            int DisctrictId = (int)HttpContext.Current.Session["DistrictId"];
            DataSet dsReports;

            ProcessGetDailyReports reports = new ProcessGetDailyReports();
            if(kitchenId == 1)
                dsReports = reports.GetCorrectiveActionReportsByDistrictId(DisctrictId, startDate, endDate);
            else
                dsReports = reports.GetCorrectiveActionReportsByDate(1, startDate, endDate, kitchenId);
            grdReport.DataSource = dsReports;
            grdReport.DataBind();
        }
        [WebMethod]
        public static CorrectiveActionsUpdate[] CorrectiveActionFeed()
        {
            List<CorrectiveActionsUpdate> details = new List<CorrectiveActionsUpdate>();
            int DisctrictId = (int)HttpContext.Current.Session["DistrictId"];
            DateTime startDate = DateTime.Today;
            DateTime endDate = DateTime.Today;
            ProcessGetDailyReports reports = new ProcessGetDailyReports();
            DataSet dsReports = reports.GetCorrectiveActionReportsByDistrictId(DisctrictId, startDate, endDate);
            foreach (DataRow row in dsReports.Tables[0].Rows)
            {
                CorrectiveActionsUpdate update = new CorrectiveActionsUpdate();
                update.CorrectiveAction = row["CorrectiveAction"].ToString();
                update.Staff = row["Staff"].ToString();
                update.Name = row["Name"].ToString();
                update.Question = row["Question"].ToString();
                update.OpenField = row["OpenField"].ToString();
                DateTime date = DateTime.Parse(row["EntryDate"].ToString());
                update.EntryDate = date.ToShortDateString();
                update.EntryTime = date.ToShortTimeString();
                update.Kitchen = row["Kitchen"].ToString();
                details.Add(update);
            }
            return details.ToArray();
        }
        public class CorrectiveActionsUpdate
        {
            public string CorrectiveAction { get; set; }
            public string Staff { get; set; }
            public string Name { get; set; }
            public string Question { get; set; }
            public string OpenField { get; set; }           
            public string EntryDate { get; set; }
            public string EntryTime { get; set; }
            public string Kitchen { get; set; }
        }
    }
}