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
using System.Globalization;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_KitchenReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["task"] != null)
            {
                switch (Request.QueryString["task"].ToString().ToUpper().Trim())
                {
                    case "COLD HOLDING LOG":
                        ddlReportName.SelectedIndex = 0;
                        break;
                    case "COOLING TEMPERATURE LOG":
                        ddlReportName.SelectedIndex = 1;
                        break;
                    case "FOOD SAFETY CHECK LIST":
                        ddlReportName.SelectedIndex = 2;
                        break;
                    case "FREEZER LOG":
                        ddlReportName.SelectedIndex = 3;
                        break;
                    case "HOT HOLDING LOG":
                        ddlReportName.SelectedIndex = 4;
                        break;
                    case "PH LOG":
                        ddlReportName.SelectedIndex = 5;
                        break;
                    case "PEST CONTROL LOG":
                        ddlReportName.SelectedIndex = 6;
                        break;
                    case "RECEIVING LOG":
                        ddlReportName.SelectedIndex = 7;
                        break;
                    case "REFRIGERATION LOG":
                        ddlReportName.SelectedIndex = 8;
                        break;
                    case "SHIPPING LOG":
                        ddlReportName.SelectedIndex = 9;
                        break;
                    case "TEMPERATURE LOG":
                        ddlReportName.SelectedIndex = 10;
                        break;
                    case "THERMOMETER CALIBRATION":
                        ddlReportName.SelectedIndex = 11;
                        break;
                    case "VALIDATION CHECKLIST":
                        ddlReportName.SelectedIndex = 12;
                        break;

                }
            }
            if (Request.QueryString["KitchenId"] != null)
            {
                Session["KitchenId"] = int.Parse(Request.QueryString["KitchenId"]);
            }
            if (Request.QueryString["Name"] != null)
            {
                lblKitchen.Text = Request.QueryString["Name"];
            }
        }

    }
    protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    {
        BindData(0);
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    private void ExportToExcel(GridView grdData,string ReportName)
    {
        ProcessGetFoodCategory getFoodCategories = new ProcessGetFoodCategory();
        Response.ClearContent();
        //Response.AddHeader("content-disposition", "attachment; filename=" + Request.QueryString["Name"] + "_" + ReportName + "_" + cldStartDate.SelectedDate.ToShortDateString() + "_" + cldEndDate.SelectedDate.ToShortDateString() + "_" + DateTime.Now.Millisecond.ToString() + ".xls");
        string strReportName = Request.QueryString["Name"] + "_" + ReportName + "_" + cldStartDate.SelectedDate.ToShortDateString() + "_" + cldEndDate.SelectedDate.ToShortDateString() + "_" + DateTime.Now.Millisecond.ToString() + ".xls";
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
    private void BindData(int ExporttoExcel)
    {
        ProcessGetDailyReports dailyReport = new ProcessGetDailyReports();
        DataSet dsReport;
        switch (ddlReportName.SelectedIndex)
        {

            case 0:
                //Cleaning Log

                dsReport = dailyReport.GetDailyReportsByDate(16, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdCleaning.DataSource = dsReport;
                grdCleaning.DataBind();
                grdCleaning.Visible = true;
                if(ExporttoExcel == 1)
                ExportToExcel(grdCleaning, "Cleaning and Sanitization Log");                
                break;
            case 1:
                //Cold Holding Log

                dsReport = dailyReport.GetDailyReportsByDate(1, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdReport.DataSource = dsReport;
                grdReport.DataBind();
                grdReport.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdReport, "Cold Holding Log");

                break;
            case 2:
                //Freezer Log

                dsReport = dailyReport.GetDailyReportsByDate(2, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdFreezerLog.DataSource = dsReport;
                grdFreezerLog.DataBind();
                grdFreezerLog.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdFreezerLog, "Cooling Temperature Log");
                break;
            case 3:
                //Food Safety
                //int nStartWeek, nEndWeek,nStartYear,nEndYear;
                //nStartWeek = GetWeekNumber(cldStartDate.SelectedDate);
                //nEndWeek = GetWeekNumber(cldEndDate.SelectedDate);
                //nStartYear = cldStartDate.SelectedDate.Year;
                //nEndYear = cldEndDate.SelectedDate.Year;

                dsReport = dailyReport.GetDailyReportsByDate(10, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                //ProcessGetWeeklyReport weeklyReport = new ProcessGetWeeklyReport();
                //dsReport = weeklyReport.GetFoodSafetyDates(nStartWeek, nEndWeek, (int)Session["KitchenId"],nStartYear,nEndYear);

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
                grdFoodSafety.DataSource = dsReport;
                grdFoodSafety.DataBind();
                grdFoodSafety.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdFoodSafety, "Food Safety Checklist");
                break;
            case 4:
                //Freezer Log

                dsReport = dailyReport.GetDailyReportsByDate(11, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdFreezerNewLog.DataSource = dsReport;
                grdFreezerNewLog.DataBind();
                grdFreezerNewLog.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdFreezerNewLog, "Freezer Log");
                break;
            case 5:
                //Hot Holding Log

                dsReport = dailyReport.GetDailyReportsByDate(4, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdReport.DataSource = dsReport;
                grdReport.DataBind();
                grdReport.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdReport, "Hot Holding Log");
                break;
            case 6:
                //Maintenance Log

                dsReport = dailyReport.GetDailyReportsByDate(15, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdMaintenance.DataSource = dsReport;
                grdMaintenance.DataBind();
                grdMaintenance.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdMaintenance, "Maintenance Log");
                break;
            case 7:
                //Pest Control Log

                dsReport = dailyReport.GetDailyReportsByDate(14, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdPest.DataSource = dsReport;
                grdPest.DataBind();
                grdPest.Visible = true;
                grdPhLog.Visible = false;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdPest, "Pest Control Log");
                break;
            case 8:
                //PH Log

                dsReport = dailyReport.GetDailyReportsByDate(13, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdPhLog.DataSource = dsReport;
                grdPhLog.DataBind();
                grdPhLog.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdPhLog, "PH Log");
                break;
            case 9:
                //Receiving Log

                dsReport = dailyReport.GetDailyReportsByDate(5, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdReceivingLog.DataSource = dsReport;
                grdReceivingLog.DataBind();
                grdReceivingLog.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdReceivingLog, "Receiving Log");
                break;
            case 10:
                //Refrigeration Log

                dsReport = dailyReport.GetDailyReportsByDate(6, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdRefrigerationLog.DataSource = dsReport;
                grdRefrigerationLog.DataBind();
                grdRefrigerationLog.Visible = true;
                grdFreezerNewLog.Visible = false;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdRefrigerationLog, "Refrigration Log");
                break;
            case 11:
                //Shipping Log

                dsReport = dailyReport.GetDailyReportsByDate(12, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdShippingLog.DataSource = dsReport;
                grdShippingLog.DataBind();
                grdShippingLog.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdShippingLog, "Shipping Log");
                break;
            case 12:
                //Temperature Log

                dsReport = dailyReport.GetDailyReportsByDate(7, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdReport.DataSource = dsReport;
                grdReport.DataBind();
                grdReport.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdReport, "Temperature Log");
                break;
            case 13:
                //Thermo Casliberation Log

                dsReport = dailyReport.GetDailyReportsByDate(8, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);
                if (dsReport.Tables[0].Rows.Count > 0)
                {
                    lblMessage.Visible = false;
                }
                else
                {
                    lblMessage.Visible = true;
                }
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
                grdThermoCaliberationLog.DataSource = dsReport;
                grdThermoCaliberationLog.DataBind();
                grdThermoCaliberationLog.Visible = true;
                if (ExporttoExcel == 1)
                    ExportToExcel(grdThermoCaliberationLog, "Thermo Casliberation Log");
                break;
            case 14:
                //Validation Checklist

                //int nStartWeek, nEndWeek, nStartYear, nEndYear;
                //nStartWeek = GetWeekNumber(cldStartDate.SelectedDate);
                //nEndWeek = GetWeekNumber(cldEndDate.SelectedDate);
                //nStartYear = cldStartDate.SelectedDate.Year;
                //nEndYear = cldEndDate.SelectedDate.Year;
                dsReport = dailyReport.GetDailyReportsByDate(9, cldStartDate.SelectedDate, cldEndDate.SelectedDate, (int)Session["KitchenId"]);

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
                grdThermoCaliberationLog.Visible = false;
                grdValidation.DataSource = dsReport;
                grdValidation.DataBind();
                if (ExporttoExcel == 1)
                    ExportToExcel(grdValidation, "Validation Log");
                break;



        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void lkbPrintReport_Click(object sender, EventArgs e)
    {
        string strReportIndex,strStartDate,strEndDate;
        strReportIndex = ddlReportName.SelectedIndex.ToString();
        strStartDate = cldStartDate.SelectedDate.ToShortDateString();
        strEndDate = cldEndDate.SelectedDate.ToShortDateString();
        //Response.Redirect("~/ControlPanel/District/PrintReport.aspx?Report=" + strReportIndex + "&StartDate=" + strStartDate + "&EndDate=" + strEndDate);
        BindData(1);
    }
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
                hlView.NavigateUrl = "~/ControlPanel/District/PrintChecklist.aspx?date=" + dtRequired.ToShortDateString() + "&HistoryId=" + hfHistoryId.Value;
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

}
