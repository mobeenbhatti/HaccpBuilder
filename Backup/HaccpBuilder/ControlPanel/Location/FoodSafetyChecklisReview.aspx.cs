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

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_Location_FoodSafetyChecklisReview : System.Web.UI.Page
{
    public static int nWeek, nYear;
    public static DateTime dtDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Make Changes for Review Page
        // 12-03-08
        if (IsPostBack != true)
        {

            /* if (Request.QueryString["week"] != null)
             {
                 nWeek = int.Parse(Request.QueryString["week"]);
                 nYear = int.Parse(Request.QueryString["year"]);
                 ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
                 IDataReader dr = getHistory.GetHistoryByWeek((int)Session["KitchenId"], nWeek, nYear);
                 if (dr.Read())
                 {
                     Session["HistoryId"] = int.Parse(dr["HistoryId"].ToString());
                     //lblInfo.Text = "Food Safety Checklist for Date: " + Request.QueryString["date"].ToString();
                     lblObserverValue.Text = dr["Observer"].ToString();
                     lblWeekDate.Text = GetFirstDayOfWeek(nWeek, nYear).ToLongDateString();
                     if (dr["EntryDate"].ToString() != "")
                     {
                         lblEntryDate.Text =DateTime.Parse(dr["EntryDate"].ToString()).ToLongDateString();
                     }
                     else
                     {
                         lblEntryDate.Text = DateTime.Today.ToLongDateString();
                     }
                 }
             }
             */
            if (Request.QueryString["Date"] != null)
            {
                dtDate = DateTime.Parse(Request.QueryString["Date"]);
                ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
                IDataReader dr = getHistory.GetHistoryByDate((int)Session["KitchenId"], dtDate);
                if (dr.Read())
                {
                    Session["HistoryId"] = int.Parse(dr["HistoryId"].ToString());
                    //lblInfo.Text = "Food Safety Checklist for Date: " + Request.QueryString["date"].ToString();
                    lblObserverValue.Text = dr["Observer"].ToString();
                    //lblWeekDate.Text = GetFirstDayOfWeek(nWeek, nYear).ToLongDateString();
                    lblWeekDate.Text = dtDate.ToLongDateString();
                    if (dr["EntryDate"].ToString() != "")
                    {
                        // MBS-(03-19-10)
                        // BUG ID - 1877
                        lblEntryDate.Text = DateTime.Parse(dr["EntryDate"].ToString()).ToLongDateString();
                        ViewState["EntryDate"] = DateTime.Parse(dr["EntryDate"].ToString()).ToShortDateString();
                    }
                    else
                    {
                        // MBS-(03-19-10)
                        // BUG ID - 1877
                        lblEntryDate.Text = DateTime.Today.ToLongDateString();
                        ViewState["EntryDate"] = DateTime.Today.ToShortDateString();
                    }
                    dr.Close();
                }
                if (dr.IsClosed == false)
                {
                    dr.Close();
                }
            }
        }
    }
    protected void grdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label titleLabel = (Label)e.Row.FindControl("lblTitle");
            // Label lkbCategory = (Label)e.Row.FindControl("lkbCategory");
            HyperLink hlCategory = (HyperLink)e.Row.FindControl("hlCategory");
            HiddenField hfSection = (HiddenField)e.Row.FindControl("hfSection");

            // MBS-(03-19-10)
            // BUG ID - 1877
            hlCategory.NavigateUrl = "~/ControlPanel/Location/FoodSafetyChecklist.aspx?week=" + DataBinder.Eval(e.Row.DataItem, "ResponseWeek") + "&Section=" + DataBinder.Eval(e.Row.DataItem, "SectionId") + "&Date=" + ViewState["EntryDate"].ToString();

            string strval = hfSection.Value;
            string title = (string)ViewState["title"];
            if (title == strval)
            {

                hlCategory.Visible = false;
                hlCategory.Text = string.Empty;
                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                hlCategory.Text = getCategory(title);
                hlCategory.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }

        }
    }
    public string getCategory(string strSectionId)
    {
        string strSection = "";
        switch (strSectionId)
        {

            case "PA":
                strSection = "Personal Hygiene";
                break;
            case "FP":
                strSection = "Food Preparation";
                break;
            case "HH":
                strSection = "Hot Holding";
                break;
            case "CH":
                strSection = "Cold Holding";
                break;
            case "RFM":
                strSection = "Refrigerator, Freezer, And Milk Cooler";
                break;
            case "FSDS":
                strSection = "Food Storage and Dry Storage";
                break;
            case "CS":
                strSection = "Cleaning and Sanitizing";
                break;
            case "UE":
                strSection = "Utensils and Equipment";
                break;
            case "LE":
                strSection = "Large Equipment";
                break;
            case "GSD":
                strSection = "Garbage Storage and Disposal";
                break;
            case "PC":
                strSection = "Pest Control";
                break;
        }
        return strSection;

    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        DateTime dtEntryDate = DateTime.Parse(lblEntryDate.Text);
        ProcessSetResponseHistory setResponseHistory = new ProcessSetResponseHistory();
        setResponseHistory.SetHistoryStatus((int)Session["HistoryId"], 1, dtEntryDate);
        Response.Redirect("Default.aspx");
    }
    public DateTime GetFirstDayOfWeek(int nWeek, int nYear)
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
}
