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

public partial class ControlPanel_District_KitchenAlerts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToShortDateString();
        lblKitchen.Text = "Kitchen: " + Request.QueryString["Kitchen"];
    }
    protected void grdDailyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           

            Label hlTask = (Label)e.Row.FindControl("hlTableName");
            HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
            HyperLink hlCorrectiveAction = (HyperLink)e.Row.FindControl("hlActions");

            /////////////////////////////////////////
            /// TO CHECK ALERTS FOR LOG TABLES
            /// ////////////////////////////////////
            ProcessGetDailyReports getDailyReport = new ProcessGetDailyReports();
            DataSet dsAlerts = getDailyReport.GetAlertDates(hlTask.Text.ToUpper().Trim(), int.Parse(Request.QueryString["KitchenId"]));
            if (dsAlerts.Tables[0].Rows.Count > 0)
            {
                hlAlert.Text = "Yes";
                hlAlert.ForeColor = System.Drawing.Color.Red;
                hlAlert.NavigateUrl = "~/ControlPanel/District/AlertsDates.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName") + "&KitchenId=" + Request.QueryString["KitchenId"] + "&Kitchen=" + Request.QueryString["Kitchen"];
            }

           
            //////////////////////////////////////////

            /////////////////////////////////////////
            ///// TO CHECK CORRECTIVE ACTIONS
            ///// //////////////////////////////////
            //ProcessGetDailyReports getCorrectiveActions = new ProcessGetDailyReports();
            //DataSet dsCorrectiveAction = getCorrectiveActions.GetCorrectiveActions(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
            //if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
            //{
            //    hlCorrectiveAction.Text = "Yes";
            //    hlCorrectiveAction.NavigateUrl = "~/ControlPanel/Kitchen/CorrectiveActions.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
            //}
            //else
            //{
            //    hlCorrectiveAction.Text = "No";
            //}
            /////////////////////////////////////

        }

    }
    protected void grdDailyReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void grdWeeklyReports_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void grdWeeklyReports_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
            Label hlTask = (Label)e.Row.FindControl("hlTableName");
            HyperLink hlCorrectiveAction = (HyperLink)e.Row.FindControl("hlActions");

           
            ///////////////////////////////////////
            /// TO CHECK CORRECTIVE ACTIONS
            /// //////////////////////////////////

            //ProcessGetWeeklyReport getCorrectiveActions = new ProcessGetWeeklyReport();
            //DataSet dsCorrectiveAction = getCorrectiveActions.GetCorrectiveActions(hlTask.Text.ToUpper().Trim(), (int)Session["KitchenId"]);
            //if (dsCorrectiveAction.Tables[0].Rows.Count > 0)
            //{
            //    hlCorrectiveAction.Text = "Yes";
            //    hlCorrectiveAction.NavigateUrl = "~/ControlPanel/Kitchen/CorrectiveActions.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
            //}
            //else
            //{
            //    hlCorrectiveAction.Text = "No";
            //}
            /////////////////////////////////////

            /////////////////////////////////////////
            /// TO CHECK ALERTS FOR LOG TABLES
            /// ////////////////////////////////////
            ProcessGetWeeklyReport getWeeklyReport = new ProcessGetWeeklyReport();
            DataSet dsAlerts = getWeeklyReport.GetAlertDates(hlTask.Text.ToUpper().Trim(), int.Parse(Request.QueryString["KitchenId"]));
            if (dsAlerts.Tables[0].Rows.Count > 0)
            {
                hlAlert.Text = "Yes";
                hlAlert.ForeColor = System.Drawing.Color.Red;
                hlAlert.NavigateUrl = "~/ControlPanel/District/AlertsDates.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName") + "&KitchenId=" + Request.QueryString["KitchenId"] + "&Kitchen=" + Request.QueryString["Kitchen"];
            }
            ///////////////////////////////////////
           
        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
}
