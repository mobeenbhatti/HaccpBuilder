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



public partial class ControlPanel_District_MealServingByDate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            int nMealCalendarId, nEventId, nKitchenId;
            nMealCalendarId = int.Parse(Request.QueryString["MealCalendarId"]);
            nEventId = int.Parse(Request.QueryString["EventId"]);
            nKitchenId = (int)Session["KitchenId"];
            hfEventId.Value = Request.QueryString["EventId"];
            hfMealCalendarId.Value = Request.QueryString["MealCalendarId"];
            ProcessGetDailyMeal dailyMeal = new ProcessGetDailyMeal();
            //grdMenuItem.DataSource = dailyLunch.GetDailyMealByKitchenId(int.Parse(hfId.Value), 2, (int)Session["KitchenId"]);
            grdMenuItem.DataSource = dailyMeal.GetDailyMealByKitchenId(nMealCalendarId, nEventId, nKitchenId);
            grdMenuItem.DataBind();
        }
    }
    protected void btnAcceptPlan_Click(object sender, ImageClickEventArgs e)
    {
        DailyMeal dailyMeal = new DailyMeal();
        dailyMeal.MealCalendarId = int.Parse(hfMealCalendarId.Value);
        dailyMeal.EventId = int.Parse(hfEventId.Value);
        ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
        deleteDailyMeal.DailyMeal = dailyMeal;
        deleteDailyMeal.Invoke();

        ///////////////////////////
        // SAVE  DATA
        ///////////////////////////
        int totalItems = grdMenuItem.Items.Count;
        for (int i = 0; i < totalItems; i++)
        {
            CheckBox chkItem = (CheckBox)grdMenuItem.Items[i].FindControl("chkBreakFast");
            if (chkItem != null)
            {
                if (chkItem.Checked)
                {
                    DailyMeal dailyMealNew = new DailyMeal();
                    dailyMealNew.EventId = 1;
                    dailyMealNew.MealCalendarId = int.Parse(hfMealCalendarId.Value);
                    dailyMealNew.MenuItemId = int.Parse(((HiddenField)grdMenuItem.Items[i].FindControl("hfMenuItemId")).Value);
                    ProcessCreateDailyMeal createDailyMeal = new ProcessCreateDailyMeal();
                    createDailyMeal.DailyMeal = dailyMealNew;
                    createDailyMeal.Invoke();
                    //lblLunch.Text = "Menu Item Picked";
                }
            } // End If             

        } // End Loop
        Response.Write("<script language=javascript>window.returnValue = 'OK';window.close();</script>");

    }
    protected void btnEditPlan_Click(object sender, ImageClickEventArgs e)
    {

    }
}
