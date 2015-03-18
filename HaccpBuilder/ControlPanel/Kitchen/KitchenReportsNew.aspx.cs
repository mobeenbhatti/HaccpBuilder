using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;
using eWorld.UI;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Globalization;
using System.Web.Services;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class KitchenReports : System.Web.UI.Page
    {
        private string _ReportName;
        private DateTime _dtStartDate, _dtEndDate;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void grdDailyReports_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                // RGK-(03-19-10)
                // BUG ID - 1090
                if (e.CommandArgument.ToString() != "")
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    CalendarPopup startDateCal = (CalendarPopup)row.Cells[1].FindControl("cldStartDate");
                    CalendarPopup endDateCal = (CalendarPopup)row.Cells[2].FindControl("cldEndDate");
                    LinkButton lkbView = e.CommandSource as LinkButton;
                    HiddenField hfSectionId = (HiddenField)row.Cells[2].FindControl("hfSectionId"); ;
                    HiddenField hfTypeId = (HiddenField)row.Cells[2].FindControl("hfTypeId");
                    if (hfTypeId.Value == "99")
                    {
                        ReportName = lkbView.CommandArgument.ToString();
                        StartDate = startDateCal.SelectedDate;
                        EndDate = endDateCal.SelectedDate;
                        BindChecklistData(int.Parse(hfSectionId.Value),0);
                    }
                    if (startDateCal != null && endDateCal != null)
                    {
                        ReportName = lkbView.CommandArgument.ToString();
                        StartDate = startDateCal.SelectedDate;
                        EndDate = endDateCal.SelectedDate;
                        BindData(0);
                    }
                }
                lblReport.Focus();
            }
            if (e.CommandName == "Export")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    CalendarPopup startDateCal = (CalendarPopup)row.Cells[1].FindControl("cldStartDate");
                    CalendarPopup endDateCal = (CalendarPopup)row.Cells[1].FindControl("cldEndDate");
                    LinkButton lkbExport = e.CommandSource as LinkButton;
                    HiddenField hfSectionId = (HiddenField)row.Cells[2].FindControl("hfSectionId"); ;
                    HiddenField hfTypeId = (HiddenField)row.Cells[2].FindControl("hfTypeId");
                    if (hfTypeId.Value == "99")
                    {
                        ReportName = lkbExport.CommandArgument.ToString();
                        StartDate = startDateCal.SelectedDate;
                        EndDate = endDateCal.SelectedDate;
                        BindChecklistData(int.Parse(hfSectionId.Value), 1);
                    }
                    if (startDateCal != null && endDateCal != null)
                    {
                        ReportName = lkbExport.CommandArgument.ToString();
                        StartDate = startDateCal.SelectedDate;
                        EndDate = endDateCal.SelectedDate;
                        BindData(1);
                    }
                }
            }
        }
        private void BindChecklistData(int sectionId, int ExporttoExcel)
        {
            ProcessGetDailyReports dailyReport = new ProcessGetDailyReports();
            DataSet dsReport;           
            dsReport = dailyReport.GetChecklistReportsByDate(sectionId, StartDate, EndDate, (int)Session["KitchenId"]);
            lblReport.Text = ReportName;
            grdColdHoldingLog.Visible = false;
            grdHotHoldingLog.Visible = false;
            grdCheckList.Visible = true;
            grdReceivingLog.Visible = false;
            grdShippingLog.Visible = false;
            grdRefrigerationLog.Visible = false;
            grdFreezerNewLog.Visible = false;
            grdThermoCaliberationLog.Visible = false;
            grdFreezerLog.Visible = false;
            grdFoodSafety.Visible = false;
            grdValidation.Visible = false;
            grdPhLog.Visible = false;
            grdPest.Visible = false;
            grdMaintenance.Visible = false;
            grdReport.Visible = false;
            grdCheckList.DataSource = dsReport;
            grdCheckList.DataBind();
            grdCleaning.Visible = false;
            if (ExporttoExcel == 1)
                ExportToExcel(grdCheckList, ReportName);            
        }
        private void BindData(int ExporttoExcel)
        {
            ProcessGetDailyReports dailyReport = new ProcessGetDailyReports();
            DataSet dsReport;
            switch (ReportName)
            {
                case "Corrective Action Report":
                    dsReport = dailyReport.GetCorrectiveActionReportsByDate(17, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Corrective Actions";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = true;
                    grdReceivingLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdReport.Visible = false;
                    grdCheckList.Visible  = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = true;
                    grdCorrectiveAciton.DataSource = dsReport;
                    grdCorrectiveAciton.DataBind();
                    
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdCheckList, "Checklist Add-On");
                    break;
                case "Checklist Add-On":
                    dsReport = dailyReport.GetDailyReportsByDate(17, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Checklist Add-On";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = true;
                    grdReceivingLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdReport.Visible = false;
                    grdCheckList.DataSource = dsReport;
                    grdCheckList.DataBind();
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdCheckList, "Checklist Add-On");
                    break;

                case "Cleaning and Sanitization Log":
                    //Cleaning Log

                    dsReport = dailyReport.GetDailyReportsByDate(16, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Cleaning and Sanitization Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdReport.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdCleaning.DataSource = dsReport;
                    grdCleaning.DataBind();
                    grdCleaning.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdCleaning, "Cleaning and Sanitization Log");
                    break;
                case "Cold Holding Log":
                    //Cold Holding Log

                    dsReport = dailyReport.GetDailyReportsByDate(1, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Cold Holding Log";

                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdColdHoldingLog.DataSource = dsReport;
                    grdColdHoldingLog.DataBind();
                    grdColdHoldingLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdColdHoldingLog, "Cold Holding Log");

                    break;
                case "Cooling Temperature Log":
                    //Freezer Log

                    dsReport = dailyReport.GetDailyReportsByDate(2, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Cooling Temperature Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdReport.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdFreezerLog.DataSource = dsReport;
                    grdFreezerLog.DataBind();
                    grdFreezerLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdFreezerLog, "Cooling Temperature Log");
                    break;
                case "Food Safety Check List":

                    dsReport = dailyReport.GetDailyReportsByDate(10, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Food Safety Check List";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdPhLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdValidation.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdFoodSafety.DataSource = dsReport;
                    grdFoodSafety.DataBind();
                    grdFoodSafety.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdFoodSafety, "Food Safety Checklist");
                    break;
                case "Freezer Log":
                    //Freezer Log

                    dsReport = dailyReport.GetDailyReportsByDate(11, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Freezer Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdFreezerNewLog.DataSource = dsReport;
                    grdFreezerNewLog.DataBind();
                    grdFreezerNewLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdFreezerNewLog, "Freezer Log");
                    break;
                case "Hot Holding Log":
                    //Hot Holding Log

                    dsReport = dailyReport.GetDailyReportsByDate(4, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Hot Holding Log";
                    grdColdHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdHotHoldingLog.DataSource = dsReport;
                    grdHotHoldingLog.DataBind();
                    grdHotHoldingLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdHotHoldingLog, "Hot Holding Log");
                    break;
                case "Maintenance Log":
                    //Maintenance Log

                    dsReport = dailyReport.GetDailyReportsByDate(15, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Maintenance Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdReport.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdMaintenance.DataSource = dsReport;
                    grdMaintenance.DataBind();
                    grdMaintenance.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdMaintenance, "Maintenance Log");
                    break;
                case "Pest Control Log":
                    //Pest Control Log

                    dsReport = dailyReport.GetDailyReportsByDate(14, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Pest Control Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdReport.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdPest.DataSource = dsReport;
                    grdPest.DataBind();
                    grdPest.Visible = true;
                    grdPhLog.Visible = false;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdPest, "Pest Control Log");
                    break;
                case "PH Log":
                    //PH Log

                    dsReport = dailyReport.GetDailyReportsByDate(13, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "PH Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdReport.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdPhLog.DataSource = dsReport;
                    grdPhLog.DataBind();
                    grdPhLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdPhLog, "PH Log");
                    break;
                case "Receiving Log":
                    //Receiving Log

                    dsReport = dailyReport.GetDailyReportsByDate(5, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Receiving Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdReceivingLog.DataSource = dsReport;
                    grdReceivingLog.DataBind();
                    grdReceivingLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdReceivingLog, "Receiving Log");
                    break;
                case "Refrigeration Log":
                    //Refrigeration Log

                    dsReport = dailyReport.GetDailyReportsByDate(6, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Refrigeration Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdRefrigerationLog.DataSource = dsReport;
                    grdRefrigerationLog.DataBind();
                    grdRefrigerationLog.Visible = true;
                    grdFreezerNewLog.Visible = false;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdRefrigerationLog, "Refrigration Log");
                    break;
                case "Shipping Log":
                    //Shipping Log

                    dsReport = dailyReport.GetDailyReportsByDate(12, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Shipping Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdPhLog.Visible = false;
                    grdValidation.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdShippingLog.DataSource = dsReport;
                    grdShippingLog.DataBind();
                    grdShippingLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdShippingLog, "Shipping Log");
                    break;
                case "Temperature Log":
                    //Temperature Log

                    dsReport = dailyReport.GetDailyReportsByDate(7, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Temperature Log";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdReport.DataSource = dsReport;
                    grdReport.DataBind();
                    grdReport.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdReport, "Temperature Log");
                    break;
                case "Thermometer Calibration":
                    //Thermo Casliberation Log

                    dsReport = dailyReport.GetDailyReportsByDate(8, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Thermometer Calibration";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdValidation.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdThermoCaliberationLog.DataSource = dsReport;
                    grdThermoCaliberationLog.DataBind();
                    grdThermoCaliberationLog.Visible = true;
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdThermoCaliberationLog, "Thermo Casliberation Log");
                    break;
                case "Validation Checklist":
                    dsReport = dailyReport.GetDailyReportsByDate(9, StartDate, EndDate, (int)Session["KitchenId"]);
                    lblReport.Text = "Validation Checklist";
                    grdColdHoldingLog.Visible = false;
                    grdHotHoldingLog.Visible = false;
                    grdCheckList.Visible = false;
                    grdReceivingLog.Visible = false;
                    grdRefrigerationLog.Visible = false;
                    grdFreezerNewLog.Visible = false;
                    grdShippingLog.Visible = false;
                    grdReport.Visible = false;
                    grdFreezerLog.Visible = false;
                    grdFoodSafety.Visible = false;
                    grdPhLog.Visible = false;
                    grdPest.Visible = false;
                    grdMaintenance.Visible = false;
                    grdCleaning.Visible = false;
                    grdCorrectiveAciton.Visible = false;
                    grdThermoCaliberationLog.Visible = false;
                    grdValidation.DataSource = dsReport;
                    grdValidation.DataBind();
                    if (ExporttoExcel == 1)
                        ExportToExcel(grdValidation, "Validation Log");
                    break;
            }
        }
        private void ExportToExcel(GridView grdData, string ReportName)
        {
            ProcessGetFoodCategory getFoodCategories = new ProcessGetFoodCategory();
            Response.ClearContent();
            //Response.AddHeader("content-disposition", "attachment; filename=" + Request.QueryString["Name"] + "_" + ReportName + "_" + StartDate.ToShortDateString() + "_" + EndDate.ToShortDateString() + "_" + DateTime.Now.Millisecond.ToString() + ".xls");
            string strReportName = Request.QueryString["Name"] + "_" + ReportName + "_" + StartDate.ToShortDateString() + "_" + EndDate.ToShortDateString() + "_" + DateTime.Now.Millisecond.ToString() + ".xls";
            Response.AddHeader("content-disposition", string.Format("attachment; filename = \"{0}\"", strReportName));
            Response.ContentType = "application/excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            grdData.HeaderStyle.Font.Bold = true;
            grdData.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
            grdData = null;
            grdData.Dispose();
        }
        private string ReportName
        {
            get { return _ReportName; }
            set { _ReportName = value; }
        }
        private DateTime StartDate
        {
            get { return _dtStartDate; }
            set { _dtStartDate = value; }
        }
        private DateTime EndDate
        {
            get { return _dtEndDate; }
            set { _dtEndDate = value; }
        }

        #region Web Mothods
        [WebMethod]
        public static CorrectiveActionsUpdate[] CorrectiveActionFeed()
        {
            List<CorrectiveActionsUpdate> details = new List<CorrectiveActionsUpdate>();
            int KitchenId = (int)HttpContext.Current.Session["KitchenId"];
            DateTime startDate = DateTime.Today;
            DateTime endDate = DateTime.Today;
            ProcessGetDailyReports reports = new ProcessGetDailyReports();
            DataSet dsReports = reports.GetCorrectiveActionReportsByDate(17, startDate, endDate,KitchenId);
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
        #endregion
        #region Logs Grids

        public int GetWeekNumber(DateTime dtPassed)
        {
            CultureInfo ciCurr = CultureInfo.CurrentCulture;
            int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            return weekNum;
        }
        protected void grdFoodSafety_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblDate = (Label)e.Row.FindControl("lblDate");
                HyperLink hlView = (HyperLink)e.Row.FindControl("hlView");
                HiddenField hfHistoryId = (HiddenField)e.Row.FindControl("hfHistoryId");
                int nWeek;
                int nYear;
                if (lblDate != null)
                {
                    //nWeek = int.Parse(lblDate.Text);
                    //nYear = int.Parse(DataBinder.Eval(e.Row.DataItem, "ResponseYear").ToString());
                    //DateTime dtRequired = GetLastDayOfWeek(nWeek, nYear);                
                    // lblDate.Text = dtRequired.ToShortDateString();
                    // hlView.NavigateUrl = "~/ControlPanel/District/PrintChecklist.aspx?week=" + nWeek.ToString() + "&date=" + dtRequired.ToShortDateString() + "&year=" + nYear.ToString();
                    DateTime dtRequired = DateTime.Parse(lblDate.Text);
                    hlView.NavigateUrl = "~/ControlPanel/Kitchen/PrintChecklist.aspx?date=" + dtRequired.ToShortDateString() + "&HistoryId=" + hfHistoryId.Value;
                    //hlView.NavigateUrl = "~/ControlPanel/Kitchen/Default2.aspx?task=Food Safety Check list&date=" + dtRequired.ToShortDateString() + "&Print=1&HistoryId=" + hfHistoryId.Value;

                }
            }
        }
        public DateTime GetLastDayOfWeek(int nWeek, int nYear)
        {
            // set date to the first day of the year
            DateTime dt = new DateTime(nYear, 1, 1);
            int weekNumber = nWeek;
            // mult by 7 to get the day number of the year
            int days = (weekNumber - 1) * 7;
            // get the date of that day
            DateTime dt1 = dt.AddDays(days);
            // check what day of week it is
            DayOfWeek dow = dt1.DayOfWeek;
            // to get the first day of that week - subtract the value of the DayOfWeek enum from the date
            //DateTime startDateOfWeek = dt1.AddDays(-(int)dow);
            DateTime startDateOfWeek = dt1.AddDays(5);
            //lblEntryDate.Text = dow.ToString();
            return startDateOfWeek;
        }
        public DateTime GetFirstDayInWeek(int Weeks, int Year)
        {
            //int Year = DateTime.Now.Year;
            // Get a local calendar. Adjust for your locale. 

            GregorianCalendar cal = new GregorianCalendar(GregorianCalendarTypes.USEnglish);

            // Get a DateTime value representing the first day of the year. 

            DateTime FirstDay = new DateTime(Year, 1, 1);



            // Add the number of weeks to the first day. 

            DateTime CurrentDay = cal.AddWeeks(FirstDay, Weeks - 1);



            // Subtract the weekday value to get back 

            // to the first day of the week. Add one 

            // or not, depending on what you consider 

            // the first day of the week. Is it the 

            // 0th or the 1st day? 

            // cal.AddDays(CurrentDay, cal.GetDayOfWeek(CurrentDay) + 1);
            int MonthDay = cal.GetDayOfMonth(CurrentDay);
            DateTime finalDate = cal.AddDays(CurrentDay, MonthDay);
            //return cal.AddDays(CurrentDay, (cal.GetDayOfMonth(CurrentDay) - 1));
            return CurrentDay;

        }
        protected void grdReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdReport.PageIndex = e.NewPageIndex;
            BindData(0);
        }

        protected void grdFreezerLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFreezerLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdReceivingLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdReceivingLog.PageIndex = e.NewPageIndex;
            BindData(0);

        }
        protected void grdRefrigerationLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdRefrigerationLog.PageIndex = e.NewPageIndex;
            BindData(0);

        }
        protected void grdThermoCaliberationLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdThermoCaliberationLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdShippingLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdShippingLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdFreezerNewLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFreezerNewLog.PageIndex = e.NewPageIndex;
            BindData(0);

        }
        protected void grdFoodSafety_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFoodSafety.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdReport_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            grdReport.PageIndex = e.NewSelectedIndex;
            BindData(0);
        }
        protected void grdPhLog_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            grdPhLog.PageIndex = e.NewSelectedIndex;
            BindData(0);
        }
        protected void grdPhLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPhLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdPestLog_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            grdPest.PageIndex = e.NewSelectedIndex;
            BindData(0);
        }
        protected void grdPestLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPest.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdMaintenance_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            grdMaintenance.PageIndex = e.NewSelectedIndex;
            BindData(0);
        }

        protected void grdMaintenance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMaintenance.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdCleaning_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCleaning.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        protected void grdColdHoldingLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdColdHoldingLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }

        protected void grdColdHoldingLog_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            grdColdHoldingLog.PageIndex = e.NewSelectedIndex;
            BindData(0);
        }

        protected void grdHotHoldingLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHotHoldingLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }

        protected void grdHotHoldingLog_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            grdHotHoldingLog.PageIndex = e.NewSelectedIndex;
            BindData(0);
        }
        protected void grdCheckList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblName = (Label)e.Row.FindControl("lblName");
                Label lblObserver = (Label)e.Row.FindControl("lblObserver");
                HyperLink hlEntryDate = (HyperLink)e.Row.FindControl("hlEntryDate");
                HyperLink hlEdit = (HyperLink)e.Row.FindControl("hlEdit");
                string historyId = DataBinder.Eval(e.Row.DataItem, "CheckListHistoryId").ToString();
                string nextHistoryId = (string)ViewState["HistoryId"];


                string strval = hlEntryDate.Text;
                string title = (string)ViewState["Searchtitle"];
                //if (title == strval)
                if(nextHistoryId == historyId)
                {
                    hlEntryDate.Visible = false;
                    hlEdit.Visible = false;
                    hlEntryDate.Text = string.Empty;
                    lblName.Visible = false;
                    lblName.Text = string.Empty;
                    lblObserver.Visible = false;
                    lblObserver.Text = string.Empty;
                }
                else
                {
                    //nextHistoryId  = historyId;
                    ViewState["HistoryId"] = historyId;
                    hlEntryDate.Visible = true;
                    hlEdit.Visible = true;
                    lblName.Visible = true;
                    lblObserver.Visible = true;

                }
            }
        }
        protected void grdCorrectiveAciton_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHotHoldingLog.PageIndex = e.NewPageIndex;
            BindData(0);
        }
        #endregion

        
    }
}