using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SchoolHaccp.Operational;
using eWorld.UI;

public partial class ControlPanel_Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToString();
        if (!IsPostBack)
        {
          //  grdDailyReports.DataBind();
        }



    }
    protected void Page_Init(object sender, EventArgs e)
    {


    }

    protected void grdDailyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink hlTask = (HyperLink)e.Row.FindControl("hlTableName");
            //HyperLink hlkDate1 = (HyperLink)e.Row.FindControl("hlDate1");
            //HyperLink hlkDate2 = (HyperLink)e.Row.FindControl("hlDate2");
            //HyperLink hlkDate3 = (HyperLink)e.Row.FindControl("hlDate3");
            //HyperLink hlkDate4 = (HyperLink)e.Row.FindControl("hlDate4");
            //   HyperLink hlkDate5 = (HyperLink)e.Row.FindControl("hlDate5");
            HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");

            Label lblcheckDate1 = (Label)e.Row.FindControl("lblDateFlag1");
            Label lblcheckDate2 = (Label)e.Row.FindControl("lblDateFlag2");
            Label lblcheckDate3 = (Label)e.Row.FindControl("lblDateFlag3");
            Label lblcheckDate4 = (Label)e.Row.FindControl("lblDateFlag4");
            Label lblcheckDate5 = (Label)e.Row.FindControl("lblDateFlag5");
            //Calendar cldSelectedDate = (Calendar)e.Row.FindControl("cldDate");

            //if (cldSelectedDate != null)
            //{
            //    string url = "~/ControlPanel/Default2.aspx?task=" + hlTask.Text + "&date=";
            //    cldSelectedDate.Attributes.Add("onclick", "getDate(" + cldSelectedDate.ClientID + "," + url + ")");

            //}

            //if (hlTask != null || hlkDate1 != null || hlkDate2 != null || hlkDate3 != null || hlkDate4 != null  )
            // {|| hlkDate5 != null
            //hlkDate1.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate1.Text + "&task=" + hlTask.Text;
            //hlkDate2.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate2.Text + "&task=" + hlTask.Text;
            //hlkDate3.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate3.Text + "&task=" + hlTask.Text;
            //hlkDate4.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate4.Text + "&task=" + hlTask.Text;
            //     hlkDate5.NavigateUrl = "~/ControlPanel/Default2.aspx?date=" + hlkDate5.Text + "&task=" + hlTask.Text;

            if (lblcheckDate1 != null || lblcheckDate2 != null || lblcheckDate3 != null || lblcheckDate4 != null || lblcheckDate5 != null)
            {
                if (int.Parse(lblcheckDate1.Text) > 0 || int.Parse(lblcheckDate2.Text) > 0 || int.Parse(lblcheckDate3.Text) > 0 || int.Parse(lblcheckDate4.Text) > 0 || int.Parse(lblcheckDate5.Text) > 0)
                {
                    hlAlert.Text = "Yes";
                    hlAlert.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    hlAlert.Text = "No";
                    hlAlert.ForeColor = System.Drawing.Color.Blue;
                }
            }
            // }

        }

    }
    
    protected void grdWeeklyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /////////////////////////////////
            CalendarPopup cal = e.Row.FindControl("CalendarPopup1") as CalendarPopup;
            if (cal != null)
            {
                string tableName = (e.Row.DataItem as DataRowView).Row.ItemArray[0].ToString();
                cal.CommandArgument = tableName + "";
            }
            //////////////////////////////////
            
            HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
            HyperLink hlTask = (HyperLink)e.Row.FindControl("hlTableName");

            Label lblcheckDate1 = (Label)e.Row.FindControl("lblDateFlag1");
            Label lblcheckDate2 = (Label)e.Row.FindControl("lblDateFlag2");
            Label lblcheckDate3 = (Label)e.Row.FindControl("lblDateFlag3");
            Label lblcheckDate4 = (Label)e.Row.FindControl("lblDateFlag4");
            Label lblcheckDate5 = (Label)e.Row.FindControl("lblDateFlag5");
            Calendar cldSelectedDate = (Calendar)e.Row.FindControl("cldDate");
            //if (cldSelectedDate != null)
            //{
            //    string url = "~/ControlPanel/Default2.aspx?task=" + hlTask.Text + "&date=";
            //    //   cldSelectedDate.Attributes.Add("onclick", "getDate(" + cldSelectedDate.ClientID + "," + url +")");
            //    cldSelectedDate.Attributes.Add("onclick", "getDate(" + cldSelectedDate.ClientID + "," + url + ")");

            //}


            if (lblcheckDate1 != null || lblcheckDate2 != null || lblcheckDate3 != null || lblcheckDate4 != null || lblcheckDate5 != null)
            {
                if (int.Parse(lblcheckDate1.Text) > 0 || int.Parse(lblcheckDate2.Text) > 0 || int.Parse(lblcheckDate3.Text) > 0 || int.Parse(lblcheckDate4.Text) > 0 || int.Parse(lblcheckDate5.Text) > 0)
                {
                    hlAlert.Text = "Yes";
                    hlAlert.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    hlAlert.Text = "No";
                    hlAlert.ForeColor = System.Drawing.Color.Blue;
                }
            }
        }

    }
    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Calendar cld = (Calendar)sender;
        string strDate = cld.SelectedDate.ToString();
        //GridViewRow gvRow = (GridViewRow)cld.Parent.Parent;
        //  string strValue = gvRow.Cells[0].Text;
        //   Response.Redirect("http://www.google.com");
    }

    protected void Calendar1_VisibleMonthChanged1(object sender, MonthChangedEventArgs e)
    {
       
    }
    protected void grdWeeklyReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Calendar")
        {
            eWorld.UI.CalendarPopup cal = e.CommandSource as CalendarPopup;
            string url;
            url = "~/ControlPanel/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
            Response.Redirect(url);

        }
    }
    protected void grdDailyReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Calendar")
        {
            eWorld.UI.CalendarPopup cal = e.CommandSource as CalendarPopup;
            string url;
            url = "~/ControlPanel/Default2.aspx?task=" + cal.CommandArgument.ToString() + "&date=" + cal.SelectedDate.ToShortDateString();
            Response.Redirect(url);

        }
    }

    
    
}
