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

public partial class ControlPanel_District_PrintReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Report"] != null && Request.QueryString["StartDate"] != null && Request.QueryString["EndDate"] != null)
        {
            GetReport();
        }
    }
    private void GetReport()
    {
        int nReportIndex;
        DateTime dtStartDate, dtEndDate;
        nReportIndex = int.Parse(Request.QueryString["Report"].ToString());
        dtStartDate = DateTime.Parse(Request.QueryString["StartDate"].ToString());
        dtEndDate = DateTime.Parse(Request.QueryString["EndDate"].ToString());

        ProcessGetDailyReports dailyReport = new ProcessGetDailyReports();
        DataSet dsReport;
        switch (nReportIndex)
        {
            case 0:
                //Cleaning Log
                lblReport.Text = "Cleaning and Sanitization Log";
                dsReport = dailyReport.GetDailyReportsByDate(16, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdReport.Visible = false;
                grdCleaning.Visible = true;
                grdCleaning.DataSource = dsReport;
                grdCleaning.DataBind();      
                break;
            case 1:
                //Cold Holding Log
                lblReport.Text = "Cold Holding Log";
                dsReport = dailyReport.GetDailyReportsByDate(1, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
                
                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdReport.DataSource = dsReport;
                grdReport.DataBind();
                grdReport.Visible = true;
               
                break;
            case 2:
                //Freezer Log
                lblReport.Text = "Cooling Temperature Log";
                dsReport = dailyReport.GetDailyReportsByDate(2, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
                
                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdReport.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdFreezerLog.DataSource = dsReport;
                grdFreezerLog.DataBind();
                grdFreezerLog.Visible = true;
                
                break;
            case 3:
                //Food Safety
                lblReport.Text = "Food Safety Checklist";
                int nStartWeek, nEndWeek, nStartYear, nEndYear;
                nStartWeek = GetWeekNumber(dtStartDate);
                nEndWeek = GetWeekNumber(dtEndDate);
                nStartYear = dtStartDate.Year;
                nEndYear = dtEndDate.Year;
                ProcessGetWeeklyReport weeklyReport = new ProcessGetWeeklyReport();
                //dsReport = weeklyReport.GetFoodSafetyDates(nStartWeek, nEndWeek, (int)Session["KitchenId"], nStartYear, nEndYear);
                dsReport = dailyReport.GetDailyReportsByDate(10, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
                grdCleaning.Visible = false;
                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdReport.Visible = false;
                grdFreezerLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdFoodSafety.DataSource = dsReport;
                grdFoodSafety.DataBind();
                grdFoodSafety.Visible = true;               
                break;
            case 4:
                //Freezer New Log
                lblReport.Text = "Freezer Log";
                dsReport = dailyReport.GetDailyReportsByDate(11, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdReport.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdFreezerNewLog.DataSource = dsReport;
                grdFreezerNewLog.DataBind();
                grdFreezerNewLog.Visible = true;
                grdFreezerLog.Visible = false;                
                break;
            case 5:
                //Hot Holding Log
                lblReport.Text = "Hot Holding Log";
                dsReport = dailyReport.GetDailyReportsByDate(4, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
                
                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdReport.DataSource = dsReport;
                grdReport.DataBind();
                grdReport.Visible = true;               
                break;
            case 6:
                //Maintenance Log
                lblReport.Text = "Maintenance Log";
                dsReport = dailyReport.GetDailyReportsByDate(15, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdReport.Visible = false;
                grdPest.Visible = false;
                grdPhLog.Visible = false;
                grdCleaning.Visible = false;
                grdMaintenance.DataSource = dsReport;
                grdMaintenance.DataBind();
                grdMaintenance.Visible = true;   
                break;
            case 7:
                //Pest control Log
                lblReport.Text = "Pest Control Log";
                dsReport = dailyReport.GetDailyReportsByDate(14, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdReport.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdPest.DataSource = dsReport;
                grdPest.DataBind();
                grdPhLog.Visible = false;
                grdPest.Visible = true;
                break;
            case 8:
                //Ph Log
                lblReport.Text = "Ph Log";
                dsReport = dailyReport.GetDailyReportsByDate(13, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdReport.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdPhLog.DataSource = dsReport;
                grdPhLog.DataBind();
                grdPhLog.Visible = true;   
                break;            
            case 9:
                //Receiving Log
                lblReport.Text = "Receiving Log";
                dsReport = dailyReport.GetDailyReportsByDate(5, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
               
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdReport.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdReceivingLog.DataSource = dsReport;
                grdReceivingLog.DataBind();
                grdReceivingLog.Visible = true;
              
                break;
            case 10:
                //Refrigeration Log
                lblReport.Text = "Refrigeration Log";
                dsReport = dailyReport.GetDailyReportsByDate(6, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
               
                grdReceivingLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdReport.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdRefrigerationLog.DataSource = dsReport;
                grdRefrigerationLog.DataBind();
                grdRefrigerationLog.Visible = true;               
                break;
            case 11:
                //Shipping Log
                lblReport.Text = "Shipping Log";
                dsReport = dailyReport.GetDailyReportsByDate(12, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdReport.Visible = false;
                grdFreezerLog.Visible = false;
                grdFoodSafety.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdValidation.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdCleaning.Visible = false;
                grdShippingLog.DataSource = dsReport;
                grdShippingLog.DataBind();
                grdShippingLog.Visible = true;                
                break;
            case 12:
                //Temperature Log
                lblReport.Text = "Temperature Log";
                dsReport = dailyReport.GetDailyReportsByDate(7, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
               
                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdReport.DataSource = dsReport;
                grdReport.DataBind();
                grdReport.Visible = true;               
                break;
           
            case 13:
                //Thermo Casliberation Log
                lblReport.Text = "Thermo Caliberation Log";
                dsReport = dailyReport.GetDailyReportsByDate(8, dtStartDate, dtEndDate, (int)Session["KitchenId"]);
               
                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdReport.Visible = false;
                grdFreezerLog.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdThermoCaliberationLog.DataSource = dsReport;
                grdThermoCaliberationLog.DataBind();
                grdThermoCaliberationLog.Visible = true;                
                break;
            case 14:     
                // Validation Log
                lblReport.Text = "Validation Checklist";
                dsReport = dailyReport.GetDailyReportsByDate(9, dtStartDate, dtEndDate, (int)Session["KitchenId"]);

                grdReceivingLog.Visible = false;
                grdRefrigerationLog.Visible = false;
                grdReport.Visible = false;
                grdFreezerLog.Visible = false;
                grdFoodSafety.Visible = false;
                grdPest.Visible = false;
                grdMaintenance.Visible = false;
                grdCleaning.Visible = false;
                grdThermoCaliberationLog.Visible = false;
                grdValidation.DataSource = dsReport;
                grdValidation.DataBind();    
                break;
           
        }
    }
    protected void grdFoodSafety_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblDate = (Label)e.Row.FindControl("lblDate");
            HyperLink hlView = (HyperLink)e.Row.FindControl("hlView");
            HiddenField hfHistoryId = (HiddenField)e.Row.FindControl("hfHistoryId");
            int nWeek;
            if (lblDate != null)
            {
                //nWeek = int.Parse(lblDate.Text);
                //DateTime dtRequired = GetFirstDayInWeek(nWeek);
                //lblDate.Text = dtRequired.ToShortDateString();
                //hlView.NavigateUrl = "~/ControlPanel/District/PrintChecklist.aspx?week=" + nWeek.ToString() + "&date=" + dtRequired.ToShortDateString();
                DateTime dtRequired = DateTime.Parse(lblDate.Text);
                hlView.NavigateUrl = "~/ControlPanel/District/PrintChecklist.aspx?date=" + dtRequired.ToShortDateString() + "&HistoryId=" + hfHistoryId.Value;
            }
        }
    }
    public DateTime GetFirstDayInWeek(int Weeks)
    {
        int Year = DateTime.Now.Year;
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
        GetReport();
    }

    protected void grdFreezerLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdFreezerLog.PageIndex = e.NewPageIndex;
        GetReport();
    }
    protected void grdReceivingLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdReceivingLog.PageIndex = e.NewPageIndex;
        GetReport();

    }
    protected void grdRefrigerationLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRefrigerationLog.PageIndex = e.NewPageIndex;
        GetReport();

    }
    protected void grdThermoCaliberationLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdThermoCaliberationLog.PageIndex = e.NewPageIndex;
        GetReport();
    }
    protected void grdFoodSafety_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdFoodSafety.PageIndex = e.NewPageIndex;
        GetReport();
    }
    protected void grdShippingLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdShippingLog.PageIndex = e.NewPageIndex;
        GetReport();
    }
    public int GetWeekNumber(DateTime dtPassed)
    {
        CultureInfo ciCurr = CultureInfo.CurrentCulture;
        int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
        return weekNum;
    }
    protected void grdPhLog_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        grdPhLog.PageIndex = e.NewSelectedIndex;
        GetReport();
    }
    protected void grdPhLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPhLog.PageIndex = e.NewPageIndex;
        GetReport();
    }
    protected void grdFreezerNewLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdFreezerNewLog.PageIndex = e.NewPageIndex;
        GetReport();

    }

}
