using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;


namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class PlanIndexPrintDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CategoryID"] != null)
            {
                ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
                DataSet dsKitchenPlans = getPlan.GetKitchenPlanDetailByCategoryId(int.Parse(Request.QueryString["CategoryID"]), (int)Session["KitchenId"]);
                rptKitchenPlan.DataSource = dsKitchenPlans;
                rptKitchenPlan.DataBind();
            }
            if (Request.QueryString["PlanId"] != null)
            {
                ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
                DataSet dsPlan = getPlan.GetKitchenPlanById(int.Parse(Request.QueryString["PlanID"]));
                rptKitchenPlan.DataSource = dsPlan;
                rptKitchenPlan.DataBind();
            }
        }
    }
}