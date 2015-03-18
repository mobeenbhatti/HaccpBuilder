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


public partial class ControlPanel_District_AlertsDates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["task"] != null)
        {

            lblLog.Text = Request.QueryString["task"].ToString().ToUpper().Trim();
            lblKitchen.Text = Request.QueryString["task"].ToString().ToUpper().Trim() + " FOR KITCHEN: " + Request.QueryString["Kitchen"].ToString().ToUpper().Trim();
        }
        //txtTest.Text = "<li> One </li> \n <li> Two </li>";
        //divTest.InnerHtml =  "If State or local health department requirements are based on the 2001 FDA Food Code, cook products to the following temperatures:\na.	145º F for 15 seconds<ul><li> 	Seafood, beef, and pork</li><li>	Eggs cooked to order that are placed onto a plate and immediately served</li></ul>  b.	155º F for 15 seconds<ul><li>	Ground products containing beef, pork, or fish</li> <li>	Fish nuggets or sticks</li><li>	Eggs held on a steam table</li><li>	Cubed or Salisbury steaks</li></ul>c. 165º F for 15 seconds<ul><li>	Poultry </li><li>	Stuffed fish, pork, or beef</li>  <li>	Pasta stuffed with eggs, fish, pork, or beef (such as lasagna or manicotti)</li></ul>d. 135º F for 15 seconds<ul><li>	Fresh, frozen, or canned fruits and vegetables that are going to be held on a steam table or in a hot box</li></ul>";
        ////divTest.Attributes.Add("onload", "GetData(" + divTest.ClientID + ")");
        //txtTag.Text = "If State or local health department requirements are based on the 2001 FDA Food Code, cook products to the following temperatures:\na.	145º F for 15 seconds<ul><li> 	Seafood, beef, and pork</li><li>	Eggs cooked to order that are placed onto a plate and immediately served</li></ul>  b.	155º F for 15 seconds<ul><li>	Ground products containing beef, pork, or fish</li> <li>	Fish nuggets or sticks</li><li>	Eggs held on a steam table</li><li>	Cubed or Salisbury steaks</li></ul>c. 165º F for 15 seconds<ul><li>	Poultry </li><li>	Stuffed fish, pork, or beef</li>  <li>	Pasta stuffed with eggs, fish, pork, or beef (such as lasagna or manicotti)</li></ul>d. 135º F for 15 seconds<ul><li>	Fresh, frozen, or canned fruits and vegetables that are going to be held on a steam table or in a hot box</li></ul>";

    }
    protected void rptAlertDates_OnItemCommand(object source, RepeaterCommandEventArgs e)
    {
        LinkButton btnDate = (LinkButton)e.CommandSource;

        switch (lblLog.Text)
        {
            case "TEMPERATURE LOG":
          
                    Response.Redirect("~/ControlPanel/Kitchen/TemperatureLog.aspx?date=" + btnDate.Text);
                
                
                break;
            case "HOT HOLDING LOG":


                Response.Redirect("~/ControlPanel/Kitchen/HotHoldingLog.aspx?date=" + btnDate.Text);
                
                
                break;
            case "COLD HOLDING LOG":

                Response.Redirect("~/ControlPanel/Kitchen/ColdHoldingLog.aspx?date=" + btnDate.Text);
                
                break;
            case "RECEIVING LOG":

                Response.Redirect("~/ControlPanel/Kitchen/RecievingLog.aspx?date=" + btnDate.Text);
                
                break;
            case "FREEZER LOG":

                Response.Redirect("~/ControlPanel/Kitchen/FreezerLog.aspx?date=" + btnDate.Text);
               
                break;
            case "REFRIGERATION LOG":

                Response.Redirect("~/ControlPanel/Kitchen/RefrigerationLog.aspx?date=" + btnDate.Text);
                break;
            case "THERMOMETER CALIBRATION":

                Response.Redirect("~/ControlPanel/Kitchen/ThermoCalibrationLog.aspx?date=" + btnDate.Text);
               
                break;
            case "FOOD SAFETY CHECK LIST":
                Response.Redirect("~/ControlPanel/Kitchen/Default2.aspx?task=Food Safety Check List&date=" + btnDate.Text);
                break;


        }
    }
    protected void rptAlertDates_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblDate = (Label)e.Item.FindControl("lblDates");
        int nWeek,nYear;
        if (lblLog.Text == "FOOD SAFETY CHECK LIST" && lblDate != null)
        {
            nWeek = int.Parse(lblDate.Text);
            nYear = DateTime.Today.Year;
            DateTime dtRequired = GetLastDayOfWeek(nWeek, nYear);
            //DateTime dtRequired = GetLastDayOfWeek(nWeek);
            lblDate.Text = dtRequired.ToShortDateString();          

        }
        if (lblLog.Text == "THERMOMETER CALIBRATION" && lblDate != null)
        {
            nWeek = int.Parse(lblDate.Text);
            nYear = (int)DataBinder.Eval(e.Item.DataItem, "EntryYear");
            DateTime dtRequired = GetLastDayOfWeekThermo(nWeek, nYear);
            lblDate.Text = dtRequired.ToShortDateString();

        }
    }    
    public DateTime GetLastDayOfWeekThermo(int nWeek, int nYear)
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
        DateTime startDateOfWeek = dt1.AddDays(4);
        //lblEntryDate.Text = dow.ToString();
        return startDateOfWeek;
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
}
