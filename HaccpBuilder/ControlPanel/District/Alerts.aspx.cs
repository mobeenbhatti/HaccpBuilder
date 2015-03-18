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
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_District_Alerts : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        ProcessGetKitchen kitchen = new ProcessGetKitchen();
        DataSet dsKitchenDetails = kitchen.GetKitchensByDistrictId((int)Session["DistrictId"], txtKitchen.Text);
        grdKitchenDetails.Visible = false;
        grdSearchKitchen.Visible = true;
        grdSearchKitchen.DataSource = dsKitchenDetails;
        grdSearchKitchen.DataBind();
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    private int GetAlertStatus(int nKitchenId)
    {
        int Result = 0;
        DataSet dsAlerts;
        ProcessGetDailyReports getDailyReport = new ProcessGetDailyReports();
        dsAlerts = getDailyReport.GetAlertDates("COLD HOLDING LOG",nKitchenId );
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("COOLING TEMPERATURE LOG", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("COLD HOLDING LOG", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("HOT HOLDING LOG", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("RECEIVING LOG", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;

        }
        dsAlerts = getDailyReport.GetAlertDates("REFRIGERATION LOG", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("TEMPERATURE LOG", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("THERMOMETER CALIBRATION", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        dsAlerts = getDailyReport.GetAlertDates("FOOD SAFETY CHECK LIST", nKitchenId);
        if (dsAlerts.Tables[0].Rows.Count > 0)
        {
            Result = 1;
        }
        return Result;
    }
    protected void grdKitchenDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        

    }
    protected void grdSearchKitchen_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void grdKitchenDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
        int nKitchenId;

        /////////////////////////////////////////
        /// TO CHECK ALERTS FOR KITCHENS        
        /// ////////////////////////////////////
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            nKitchenId = int.Parse(DataBinder.Eval(e.Row.DataItem, "KitchenId").ToString());
            if (GetAlertStatus(nKitchenId) == 1)
            {
                hlAlert.Text = "Yes";
                hlAlert.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    protected void grdSearchKitchen_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HyperLink hlAlert = (HyperLink)e.Row.FindControl("hlAlerts");
        int nKitchenId;

        /////////////////////////////////////////
        /// TO CHECK ALERTS FOR KITCHENS
        /// ////////////////////////////////////
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            nKitchenId = int.Parse(DataBinder.Eval(e.Row.DataItem, "KitchenId").ToString());
            if (GetAlertStatus(nKitchenId) == 1)
            {
                hlAlert.Text = "Yes";
                hlAlert.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}
