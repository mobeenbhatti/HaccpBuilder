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


public partial class ControlPanel_DailyParticipationHaccp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToShortDateString();
        if (!this.IsPostBack)
        {
            if (Session["KitchenId"] != null)
            {
                GetData();
            }
        }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    private void GetData()
    {
        //string strCustom;
        KitchenDetails kitchenDetail = new KitchenDetails();
        ProcessGetDailyParticipation getDailyParticipation = new ProcessGetDailyParticipation();
        IDataReader dailyParticipationReader = getDailyParticipation.GetDailyParticipationByKitchenId((int)Session["KitchenId"]);
        if (dailyParticipationReader.Read())
        {
            txtBreakfastServed.Text = dailyParticipationReader["AMServe"].ToString();
            txtLunchServed.Text = dailyParticipationReader["PMServe"].ToString();
            txtManagers.Text = dailyParticipationReader["Managers"].ToString();
            txtStaff.Text = dailyParticipationReader["Staff"].ToString();
            int i;
            for (i = 0; i < ddlCycleMeasuredBy.Items.Count; i++)
            {
                if (ddlCycleMeasuredBy.Items[i].Text == dailyParticipationReader["CycleMeasuredBy"].ToString())
                {
                  //  ddlCycleMeasuredBy.Items[i].Selected = true;
                    ddlCycleMeasuredBy.SelectedIndex = i;
                }
            }
            ddlCycleUnit.SelectedValue = dailyParticipationReader["UnitsInCycle"].ToString();
            ddlIsCycleRepeat.SelectedValue = dailyParticipationReader["IsCycleRepeat"].ToString();
            cldStartDate.SelectedDate = DateTime.Parse(dailyParticipationReader["StartDate"].ToString());
            cldEndDate.SelectedDate = DateTime.Parse(dailyParticipationReader["EndDate"].ToString());
            dailyParticipationReader.Close();
        }

        else
        {
            if (dailyParticipationReader.IsClosed == false)
            {
                dailyParticipationReader.Close();
            }
            SetPage();
        }

    }
    private void SetPage()
    {
        txtBreakfastServed.Text = "";
        txtLunchServed.Text = "";
        txtManagers.Text = "";
        txtStaff.Text = "";
        ddlCycleMeasuredBy.SelectedIndex = -1;
        ddlCycleUnit.SelectedIndex = -1;
        ddlIsCycleRepeat.SelectedIndex = -1;
        cldEndDate.SelectedDate = DateTime.Today;
        cldStartDate.SelectedDate = DateTime.Today;
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
            //lblError.Visible = false ;
            ProcessGetDailyParticipation getDailyParticipation = new ProcessGetDailyParticipation();
            IDataReader dailyParticipationReader = getDailyParticipation.GetDailyParticipationByKitchenId((int)Session["KitchenId"]);
            if (dailyParticipationReader.Read())
            {
                UpdateData(dailyParticipationReader["Id"].ToString());
                dailyParticipationReader.Close();
            }
            else
            {
                if (dailyParticipationReader.IsClosed == false)
                {
                    dailyParticipationReader.Close();
                }
                CreateData();
            }
            //Response.Redirect("~/ControlPanel/Kitchen/MealServingCalendar.aspx");
            Response.Redirect("~/ControlPanel/Kitchen/MealServingCalendar2.aspx");
        
    }
    private void CreateData()
    {
        
        KitchenDetails kitchenDetail = new KitchenDetails();
        kitchenDetail.AMServe = int.Parse(txtBreakfastServed.Text);
        kitchenDetail.PMServe = int.Parse(txtLunchServed.Text);
        kitchenDetail.Managers = int.Parse(txtManagers.Text);
        kitchenDetail.Staff = int.Parse(txtStaff.Text);
        kitchenDetail.IsCycleRepeat = int.Parse(ddlIsCycleRepeat.SelectedValue);
        kitchenDetail.CycleMeasuredBy = ddlCycleMeasuredBy.SelectedItem.Text;
        kitchenDetail.UnitsInCycle = int.Parse(ddlCycleUnit.SelectedValue);
        kitchenDetail.StartDate = cldStartDate.SelectedDate;
        kitchenDetail.EndDate = cldEndDate.SelectedDate;
        kitchenDetail.KitchenId = (int)Session["KitchenId"];

        ProcessCreateDailyParticipation createDailyPaerticipation = new ProcessCreateDailyParticipation();
        createDailyPaerticipation.KitchenDetails = kitchenDetail;
        createDailyPaerticipation.Invoke();
       

    }
    private void UpdateData(string strKitchenDetailId)
    {
        // This function updates the KitchenDetails Table and 
        // Delete all records from MealServingCalendar table for the specific Kitchen
        // And Insert new record with new values of Start date and End date

        KitchenDetails kitchenDetail = new KitchenDetails();
        kitchenDetail.KitchenDetailId = int.Parse(strKitchenDetailId);
        kitchenDetail.AMServe = int.Parse(txtBreakfastServed.Text);
        kitchenDetail.PMServe = int.Parse(txtLunchServed.Text);
        kitchenDetail.Managers = int.Parse(txtManagers.Text);
        kitchenDetail.Staff = int.Parse(txtStaff.Text);
        kitchenDetail.IsCycleRepeat = int.Parse(ddlIsCycleRepeat.SelectedValue);
        kitchenDetail.CycleMeasuredBy = ddlCycleMeasuredBy.SelectedItem.Text;
        kitchenDetail.UnitsInCycle = int.Parse(ddlCycleUnit.SelectedValue);
        kitchenDetail.StartDate = cldStartDate.SelectedDate;
        kitchenDetail.EndDate = cldEndDate.SelectedDate;
        kitchenDetail.KitchenId = (int)Session["KitchenId"];

        ProcessSetDailyParticipation setDailyParticipation = new ProcessSetDailyParticipation();
        setDailyParticipation.KitchenDetails = kitchenDetail;
        setDailyParticipation.Invoke();

        // Deletion of all records from MealServingCalendar table
        //MealServingCalendar mealCalendar = new MealServingCalendar();
        //mealCalendar.KitchenId = (int)Session["KitchenId"];
        //ProcessDeleteMealServingCalendar deleteMealCalendar = new ProcessDeleteMealServingCalendar();
        //deleteMealCalendar.MealServingCalendar = mealCalendar;
        //deleteMealCalendar.DeleteMealServingCalendarByKitchenId();

        //Insertion of new records
        //int nPeriod;
        //DateTime dtStartDate = cldStartDate.SelectedDate;
        //TimeSpan tspan = cldEndDate.SelectedDate.Subtract(cldStartDate.SelectedDate);
        //nPeriod = tspan.Days;
        ////nPeriod = cldEndDate.SelectedDate - cldStartDate.SelectedDate;
        ////nPeriod = int.Parse((cldEndDate.SelectedDate - cldStartDate.SelectedDate).ToString());
        //for (int i = 0; i <= nPeriod; i++)
        //{
        //    MealServingCalendar newMealCalendar = new MealServingCalendar();
        //    newMealCalendar.KitchenId = (int)Session["KitchenId"];
        //    newMealCalendar.MealDate = dtStartDate;
        //    ProcessCreateMealServingCalendar createMealCalendar = new ProcessCreateMealServingCalendar();
        //    createMealCalendar.MealServingCalendar = newMealCalendar;
        //    createMealCalendar.Invoke();
        //    dtStartDate = dtStartDate.AddDays(1);
        //}


    }
    //protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
    //{
    //    Response.Redirect("~/ControlPanel/Kitchen/MealServingCalendar.aspx");
    //}
    protected void cldEndDate_DateChanged(object sender, EventArgs e)
    {
        MealServingCalendar mealCalendar = new MealServingCalendar();
        mealCalendar.KitchenId = (int)Session["KitchenId"];
        ProcessDeleteMealServingCalendar deleteMealCalendar = new ProcessDeleteMealServingCalendar();
        deleteMealCalendar.MealServingCalendar = mealCalendar;
        deleteMealCalendar.DeleteMealServingCalendarByKitchenId();

        int nPeriod;
        DateTime dtStartDate = cldStartDate.SelectedDate;        
        TimeSpan tspan = cldEndDate.SelectedDate.Subtract(cldStartDate.SelectedDate);
        nPeriod = tspan.Days;
       
        for (int i = 0; i <= nPeriod; i++)
        {
            MealServingCalendar mealCalendarNew = new MealServingCalendar();
            mealCalendarNew.KitchenId = (int)Session["KitchenId"];
            mealCalendarNew.MealDate = dtStartDate;
            //ProcessSetMealServingCalendar setMealCalendar = new ProcessSetMealServingCalendar();
            //setMealCalendar.MealServingCalendar = mealCalendar;
            //setMealCalendar.Invoke();
            ProcessCreateMealServingCalendar createMealCalendar = new ProcessCreateMealServingCalendar();
            createMealCalendar.MealServingCalendar = mealCalendarNew;
            createMealCalendar.Invoke();
            dtStartDate = dtStartDate.AddDays(1);
        }
    }
    protected void cldStartDate_DateChanged(object sender, EventArgs e)
    {
        MealServingCalendar mealCalendar = new MealServingCalendar();
        mealCalendar.KitchenId = (int)Session["KitchenId"];
        ProcessDeleteMealServingCalendar deleteMealCalendar = new ProcessDeleteMealServingCalendar();
        deleteMealCalendar.MealServingCalendar = mealCalendar;
        deleteMealCalendar.DeleteMealServingCalendarByKitchenId();

        int nPeriod;
        DateTime dtStartDate = cldStartDate.SelectedDate;
        TimeSpan tspan = cldEndDate.SelectedDate.Subtract(cldStartDate.SelectedDate);
        nPeriod = tspan.Days;

        for (int i = 0; i <= nPeriod; i++)
        {
            MealServingCalendar mealCalendarNew = new MealServingCalendar();
            mealCalendarNew.KitchenId = (int)Session["KitchenId"];
            mealCalendarNew.MealDate = dtStartDate;
            //ProcessSetMealServingCalendar setMealCalendar = new ProcessSetMealServingCalendar();
            //setMealCalendar.MealServingCalendar = mealCalendar;
            //setMealCalendar.Invoke();
            ProcessCreateMealServingCalendar createMealCalendar = new ProcessCreateMealServingCalendar();
            createMealCalendar.MealServingCalendar = mealCalendarNew;
            createMealCalendar.Invoke();
            dtStartDate = dtStartDate.AddDays(1);
        }
    }
}
