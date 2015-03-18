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

public partial class ControlPanel_Kitchen_MealCalendarReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rptMealCalendar_OnItemCommand(object source, RepeaterCommandEventArgs e)
    {
            DataGrid grdBreakFast, grdLunch;
            Label lblBreakFast, lblLunch;  
                if (e.CommandName == "BreakFast")
                {
                    LinkButton b = (LinkButton)e.CommandSource;
                    if (b.Text == "OK")
                    {
                        b.Text = "View";
                    }
                    else
                    {
                     b.Text = "OK";
                    }
                    grdBreakFast = (DataGrid)e.Item.FindControl("grdBreakFast");
                    lblBreakFast = (Label)e.Item.FindControl("lblBreakFast");
                    if (grdBreakFast.Items.Count > 0)
                    {
                        grdBreakFast.Visible = (b.Text == "OK");
                    }
                    else
                    {
                        lblBreakFast.Visible = (b.Text == "OK");
                    }
                    //((DataGrid)e.Item.FindControl("grdBreakFast")).Visible = (b.Text == "OK");

                }            
                if (e.CommandName == "Lunch")
                {

                    LinkButton b = (LinkButton)e.CommandSource;

                    if (b.Text == "OK")
                    {
                        b.Text = "View";
                    }
                    else
                    {
                        b.Text = "OK";
                    }
                    grdLunch = (DataGrid)e.Item.FindControl("grdLunch");
                    lblLunch = (Label)e.Item.FindControl("lblLunch");
                    if (grdLunch.Items.Count > 0)
                    {
                        grdLunch.Visible = (b.Text == "OK");
                    }
                    else
                    {
                        lblLunch.Visible = (b.Text == "OK");
                    }
                    //((DataGrid)e.Item.FindControl("grdLunch")).Visible = (b.Text == "OK");
                }
            }
    
    protected void rptMealCalendar_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DataGrid grdBreakFast, grdLunch;
        HiddenField hfId;

        grdBreakFast = (DataGrid)e.Item.FindControl("grdBreakFast");
        grdLunch = (DataGrid)e.Item.FindControl("grdLunch");
        hfId = (HiddenField)e.Item.FindControl("hfMealId");

        if (grdBreakFast != null)
        {
            ProcessGetDailyMeal dailyBreakFast = new ProcessGetDailyMeal();
            grdBreakFast.DataSource = dailyBreakFast.GetDailySelectedMeal(int.Parse(hfId.Value), 1, (int)Session["KitchenId"]);
            grdBreakFast.DataBind();
        }
        if (grdLunch != null)
        {
            ProcessGetDailyMeal dailyLunch = new ProcessGetDailyMeal();
            grdLunch.DataSource = dailyLunch.GetDailySelectedMeal(int.Parse(hfId.Value), 2, (int)Session["KitchenId"]);
            grdLunch.DataBind();
        }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    protected void btnEditPlan_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default2.aspx?ViewPlan=1");
    }
}
