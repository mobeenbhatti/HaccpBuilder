using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class PlanIndexPrintNew : System.Web.UI.Page
    {
        protected string KitchenPlanId1 = "", KitchenPlanId2 = "", KitchenPlanId3 = "", KitchenPlanId4 = "", KitchenPlanId5 = "";
        protected string Category1 = "", Category2 = "", Category3 = "", Category4 = "", Category5 = "", Category6 = "", Category7 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ProcessGetKitchenPlanCategory getPlanCategory = new ProcessGetKitchenPlanCategory();
            DataSet dsCategories = getPlanCategory.GetKitchenPlanCategoryByKitchenId((int)Session["KitchenId"]);
            if (dsCategories.Tables[0].Rows.Count > 0)
            {
                Category1 = dsCategories.Tables[0].Rows[0]["Name"].ToString();
                Category2 = dsCategories.Tables[0].Rows[1]["Name"].ToString();
                Category3 = dsCategories.Tables[0].Rows[2]["Name"].ToString();
                Category4 = dsCategories.Tables[0].Rows[3]["Name"].ToString();
                Category5 = dsCategories.Tables[0].Rows[4]["Name"].ToString();
                Category6 = dsCategories.Tables[0].Rows[5]["Name"].ToString();
                Category7 = dsCategories.Tables[0].Rows[6]["Name"].ToString();
            }
            Label1.Text = DateTime.Now.ToShortDateString();
            if (TypeId == 7)
            {
                pnlSection1.Visible = false;
                pnlSection2.Visible = false;
                pnlSection4.Visible = false;
                pnlSection5.Visible = false;
                pnlSection8.Visible = false;
                pnlSection9.Visible = false;
                pnlSectionRecipe.Visible = false;
            }
        }
        protected void rptKitchenPlanCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
                HiddenField hfCategoryId = (HiddenField)e.Item.FindControl("hfPlanCategoryId");
                Repeater rptKitchenPlan = (Repeater)e.Item.FindControl("rptKitchenPlan");
                int nPlanCategoryId = int.Parse(hfCategoryId.Value);
                DataSet dsKitchenPlans = getPlan.GetKitchenPlanByCategoryId(nPlanCategoryId, (int)Session["KitchenId"]);
                rptKitchenPlan.DataSource = dsKitchenPlans;
                rptKitchenPlan.DataBind();
                //HyperLink hlProcess = (HyperLink)e.Item.FindControl("hlProcess");
                //hlProcess.Attributes.Add("onmousedown", "toggleDiv(" + DataBinder.Eval(e.Item.DataItem, "ProcessId") + ")");
                //hlAlert.NavigateUrl = "~/ControlPanel/Kitchen/AlertsDates.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
            }
        }
        protected void rptSectionOne_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HiddenField hfKitchenPlanCategoryId = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
                KitchenPlanId1 = hfKitchenPlanCategoryId.Value;
            }
        }
        protected void rptSectionTwo_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HiddenField hfKitchenPlanCategoryId = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
                KitchenPlanId2 = hfKitchenPlanCategoryId.Value;
            }
        }
        protected void rptSectionThree_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HiddenField hfKitchenPlanCategoryId = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
                KitchenPlanId3 = hfKitchenPlanCategoryId.Value;
            }
        }
        protected void rptSectionFour_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HiddenField hfKitchenPlanCategoryId = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
                KitchenPlanId4 = hfKitchenPlanCategoryId.Value;
            }
        }
        protected void rptSectionFive_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HiddenField hfKitchenPlanCategoryId = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
                KitchenPlanId5 = hfKitchenPlanCategoryId.Value;
            }
        }


        protected void rptProcess_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                int nProcesId = int.Parse(DataBinder.Eval(e.Item.DataItem, "ProcessId").ToString());
                HyperLink hlFsIs = (HyperLink)e.Item.FindControl("hlFsIs");
                HyperLink hlHaccp = (HyperLink)e.Item.FindControl("hlHaccp");
                CheckBox chkFsIs = (CheckBox)e.Item.FindControl("chkFsActive");
                CheckBox chkHaccp = (CheckBox)e.Item.FindControl("chkHaccpActive");

                if (chkHaccp.Checked == false)
                    hlHaccp.Enabled = false;

                if (chkFsIs.Checked == false)
                    hlFsIs.Enabled = false;

            }
        }
        protected void chkFsActive_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkCustom = (CheckBox)sender;

            int nProcessId, nFsIs;
            nProcessId = int.Parse(chkCustom.Text);
            nFsIs = chkCustom.Checked == true ? 1 : 0;
            ProcessSetProcess setPrcoess = new ProcessSetProcess();
            setPrcoess.UpdateKitchenProcessFsIs(nProcessId, KitchenId, nFsIs);

            rptProcess.DataBind();

        }
        protected void chkHaccpActive_CheckedChanged(object sender, EventArgs e)
        {

            CheckBox chkCustom = (CheckBox)sender;
            int nProcessId, nHaccp;
            nProcessId = int.Parse(chkCustom.Text);
            nHaccp = chkCustom.Checked == true ? 1 : 0;
            ProcessSetProcess setPrcoess = new ProcessSetProcess();
            setPrcoess.UpdateKitchenProcessHaccp(nProcessId, KitchenId, nHaccp);

            rptProcess.DataBind();
        }
        public int KitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
                }

            }
        }
        public int TypeId
        {
            get
            {
                if (Session["TypeId"] != null)
                    return (int)Session["TypeId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
                }

            }
        }
    }
}