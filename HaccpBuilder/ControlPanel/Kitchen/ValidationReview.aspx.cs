using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class ValidationReviewNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dtEntrydate;
            if (IsPostBack != true)
            {

                if (Request.QueryString["date"] != null)
                {
                    dtEntrydate = DateTime.Parse(Request.QueryString["date"]);
                    ProcessGetValidationHistory getHistory = new ProcessGetValidationHistory();

                    //ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
                    IDataReader dr = getHistory.GetHistoryByEntrydate((int)Session["KitchenId"], dtEntrydate);
                    if (dr.Read())
                    {
                        Session["HistoryId"] = int.Parse(dr["ValidationHistoryId"].ToString());
                        //lblInfo.Text = "Food Safety Checklist for Date: " + Request.QueryString["date"].ToString();
                        lblObserverValue.Text = dr["ResponsiblePerson"].ToString();
                        //lblWeekDate.Text = GetFirstDayOfWeek(nWeek, nYear).ToLongDateString();
                        if (dr["EntryDate"].ToString() != "")
                        {
                            lblEntryDate.Text = DateTime.Parse(dr["EntryDate"].ToString()).ToLongDateString();
                        }
                        else
                        {
                            lblEntryDate.Text = DateTime.Today.ToLongDateString();
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
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            DateTime dtEntryDate = DateTime.Parse(lblEntryDate.Text);
            ProcessSetResponseHistory setResponseHistory = new ProcessSetResponseHistory();
            setResponseHistory.SetHistoryStatus((int)Session["HistoryId"], 1, dtEntryDate);
            Response.Redirect("~/ControlPanel/Kitchen/FacilityTest.aspx");
        }
        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/ValidationChecklist.aspx?entrdate=" + Request.QueryString["date"]);
        }
        protected void grdQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}