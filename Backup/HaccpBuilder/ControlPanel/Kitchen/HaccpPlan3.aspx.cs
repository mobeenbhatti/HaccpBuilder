using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using System.Data;
public partial class ControlPanel_Kitchen_HaccpPlan3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProcessGetDailyReports dailyReports = new ProcessGetDailyReports();
        DataSet dsReports = dailyReports.GetReportsStatus((int)Session["KitchenId"]);
        foreach (DataRow dr in dsReports.Tables[0].Rows)
        {
            if(dr["ColdHoldingLog"].ToString() == "0")
            {
                dvColdHoldingLog.Visible = true;
                rptColdHoldingLog.Visible = false;
            }
            if (dr["HotHoldingLog"].ToString() == "0")
            {
                dvHotHoldingLog.Visible = true;
                rptHotHlodingLog.Visible = false;
            }
            if (dr["ReceivingLog"].ToString() == "0")
            {
                dvReceivingLog.Visible = true;
                rptReceivingLog.Visible = false;
            }
            if (dr["FreezerLog"].ToString() == "0")
            {
                dvCoolingLog.Visible = true;
                rptCoolingLog.Visible = false;
            }
            if (dr["RefrigerationLog"].ToString() == "0")
            {
                dvRefrigrationLog.Visible = true;
                rptRefrigrationLog.Visible = false;
            }
            if (dr["FreezerNewLog"].ToString() == "0")
            {
                dvFreezerLog.Visible = true;
                rptFreezerLog.Visible = false;
            }
            if (dr["ShippingLog"].ToString() == "0")
            {
                dvShippingLog.Visible = true;
                rptShippingLog.Visible = false;
            }
            if (dr["TemperatureLog"].ToString() == "0")
            {
                dvTemperatureLog.Visible = true;
                rptFoodcategory.Visible = false;
            }
        }
    }
    protected void rptFoodCatogary_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            DataSet dsFoodcategoryCorectiveAction;
            HiddenField hfFoodCategoryId;
            Repeater rptFoodcategoryCorectiveAction;

            //Repeater rptFoodcategory;

            System.Web.UI.HtmlControls.HtmlTableRow trFoodCategoryCorrectiveActions;
            //rptFoodcategory = (Repeater)e.Item.FindControl("rptFoodcategory");
            rptFoodcategoryCorectiveAction = (Repeater)e.Item.FindControl("rptFoodcategoryCorectiveAction");
            hfFoodCategoryId = (HiddenField)e.Item.FindControl("hfFoodCategoryId");
            trFoodCategoryCorrectiveActions = (System.Web.UI.HtmlControls.HtmlTableRow)e.Item.FindControl("trFoodCategoryCorrectiveActions");

            ProcessGetFoodCategory processGetFoodCategory = new ProcessGetFoodCategory();

            //rptFoodcategory.DataSource = processGetFoodCategory.GetFoodCategoriesByKitchenId((int)Session["KitchenId"]);
            //rptFoodcategory.DataBind();
            dsFoodcategoryCorectiveAction = processGetFoodCategory.GetFoodCategoryCorrectiveActions(int.Parse(hfFoodCategoryId.Value)); ;
            rptFoodcategoryCorectiveAction.DataSource = dsFoodcategoryCorectiveAction;
            rptFoodcategoryCorectiveAction.DataBind();

            if (dsFoodcategoryCorectiveAction.Tables[0].Rows.Count < 1)
            {
                trFoodCategoryCorrectiveActions.Visible = true;

            }
            else
            {
                trFoodCategoryCorrectiveActions.Visible = false;
            }



        }
    }
}
