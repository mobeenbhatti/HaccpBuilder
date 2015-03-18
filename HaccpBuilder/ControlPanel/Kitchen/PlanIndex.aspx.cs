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
public partial class ControlPanel_Kitchen_PlanIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void rptProcess_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
            string strProcessId;
            strProcessId = e.CommandName;

            ProcessGetProcess getProcess = new ProcessGetProcess();
            DataSet dsProcess = getProcess.GetProcessByID(Convert.ToInt32(strProcessId));
            //rptShowProcess.DataSource = dsProcess;
            //rptShowProcess.DataBind();
            dtvSOP.DataSource = dsProcess;
            dtvSOP.DataBind();
            ModalPopupExtender1.PopupControlID = this.divPopUp1.ID;
            ModalPopupExtender1.PopupDragHandleControlID = this.panelDragHandle1.ID;
            ModalPopupExtender1.Show();
           // Response.Redirect("~/ControlPanel/District/EditProcess.aspx?ProcessId=" + strProcessId + "&GroupId=" + strGroupId + "&Mode=3");
            
        
    }
    protected void rptProcess_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
      //  HyperLink hlProcess = (HyperLink)e.Item.FindControl("hlProcess");       
      //  hlProcess.Attributes.Add("onmousedown", "toggleDiv(" + DataBinder.Eval(e.Item.DataItem, "ProcessId") + ")");
       // hlAlert.NavigateUrl = "~/ControlPanel/Kitchen/AlertsDates.aspx?task=" + DataBinder.Eval(e.Row.DataItem, "TableName");
    }
    protected void rptProcessMenu_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string strProcessId;
        strProcessId = e.CommandName;

        ProcessGetMenuItemNew getMenuItems = new ProcessGetMenuItemNew();
        DataSet dsMenu = getMenuItems.GetMenuItemsNewByProcess((int)Session["KitchenId"], Convert.ToInt32(strProcessId));

        rptMenuProcess.DataSource = dsMenu;
        rptMenuProcess.DataBind();
        ModalPopupExtender1.PopupControlID = this.divPopUp.ID;
        ModalPopupExtender1.PopupDragHandleControlID = this.panelDragHandle.ID;
        ModalPopupExtender1.Show();
    }
    protected void rptMenuProcess_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
       
        
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblMenuItem = (Label)e.Item.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");


        if(lblId != null &&  lblMenuItem != null)
        {
            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title0"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblId.Visible = false;
                lblId.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title0"] = title;
                lblMenuItem.Visible = true;
                lblId.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void lkbSenitazation_Click(object sender, EventArgs e)
    {
        
       
    }
    protected void cmdPlanClose_Click(object sender, EventArgs e)
    {   
        
            KitchenPlan plan = new KitchenPlan();
            plan.KitchenId = (int)Session["KitchenId"];
            //plan.KitchenPlanId = Convert.ToInt32(hfPlanId.Value);
            plan.KitchenPlanId = 1;
            if (plan.KitchenPlanId == 1)
            {
                //plan.SanitizationPlan = txtPlan.Value;
                plan.SanitizationPlan = "Test";
            }
            if (plan.KitchenPlanId == 2)
            {
                plan.PestControlPlan = "Test";
            }
            if (plan.KitchenPlanId == 3)
            {
                plan.EquipmentMaintanencePlan = "Test";
            }
            ProcessSetKitchenPlan setKitchenPlan = new ProcessSetKitchenPlan();
            setKitchenPlan.KitchenPlan = plan;
            setKitchenPlan.Invoke();

            //ProcessSetKitchenCorrectiveAction setCorrectiveAction = new ProcessSetKitchenCorrectiveAction();
            //setCorrectiveAction.KitchenCorrectiveAction = correctiveAction;
            //setCorrectiveAction.Invoke();
        }

    protected void lkbSenitazation_Command(object sender, CommandEventArgs e)
    {
        ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
        DataSet dsPlan = getPlan.GetKitchenPlanById((int)Session["KitchenId"]);
        if (dsPlan.Tables[0].Rows.Count < 1)
        {
            ProcessCreateKitchenPlan createPlan = new ProcessCreateKitchenPlan();
            KitchenPlan plan = new KitchenPlan();
            plan.EquipmentMaintanencePlan = "";
            plan.KitchenId = (int)Session["KitchenId"];
            plan.PestControlPlan = "";
            plan.SanitizationPlan = "";
        }
        else
        {
            foreach (DataRow dr in dsPlan.Tables[0].Rows)
            {
                if (e.CommandName == "Sanitization")
                {
                    //hfPlanId.Value = "1";
                    //txtPlan.Value = dr["SanitizationPlan"].ToString();
                }
                if (e.CommandName == "PestControl")
                {
                    //hfPlanId.Value = "2";
                    //txtPlan.Value = dr["SanitizationPlan"].ToString();
                }
                if (e.CommandName == "Equipment")
                {
                    //hfPlanId.Value = "3";
                    //txtPlan.Value = dr["EquipmentMaintanencePlan"].ToString();
                }
            }
        }
        //ModalPopupExtender1.PopupControlID = divPlans.ID;
        //ModalPopupExtender1.PopupDragHandleControlID = panel1.ID;
        //ModalPopupExtender1.Show();
        
       
    }
    protected void lkbPlanOverView_Command(object sender, CommandEventArgs e)
    {
        ModalPopupExtender1.PopupControlID = dvPlanOverView.ID;
        ModalPopupExtender1.PopupDragHandleControlID = panelPlanOverView.ID;
        ModalPopupExtender1.Show();
    }
    protected void lkbControlMeasure_Command(object sender, CommandEventArgs e)
    {
        ModalPopupExtender1.PopupControlID = dvControlMeasures.ID;
        ModalPopupExtender1.PopupDragHandleControlID = panelPlanOverView.ID;
        ModalPopupExtender1.Show();
    }
}
