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

public partial class ControlPanel_Kitchen_CorrectiveActions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLog.Text = Request.QueryString["task"].ToString().ToUpper().Trim();
    }
    protected void rptCorrectiveActions_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HyperLink hlDate = (HyperLink)e.Item.FindControl("hlEntryDate");
        HiddenField hfHistoryId = (HiddenField)e.Item.FindControl("hfHistoryId");
        int nWeek,nYear;
        if (lblLog.Text == "FOOD SAFETY CHECK LIST" && hlDate != null)
        {
            //nWeek = int.Parse(hlDate.Text);
            //nYear = int.Parse(DataBinder.Eval(e.Item.DataItem, "ResponseYear").ToString());
            //DateTime dtRequired = GetFirstDayInWeek(nWeek, nYear);
            //hlDate.Text = dtRequired.ToShortDateString();
            hlDate.NavigateUrl = "~/ControlPanel/Kitchen/PrintChecklist.aspx?HistoryId=" + hfHistoryId.Value + "&Date=" + hlDate.Text;

        }
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
}
