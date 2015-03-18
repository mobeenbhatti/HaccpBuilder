using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Data;
public partial class ControlPanel_Kitchen_PlanIndexDetail : System.Web.UI.Page
{
    static bool m_UpdateMode = false;
    static bool m_AdditionalMode = false;
    private static KitchenPlan plan = new KitchenPlan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            int id = 0;
            m_AdditionalMode = Request.QueryString["Mode"] != null ? true : false;
            if (int.TryParse(Request.QueryString["PlanId"], out id))
            {
                m_UpdateMode = true;
                LoadForm(id);
                LoadKitchenPlan();
            }
            else
            {
                m_UpdateMode = false;
            }           
           
            
            SetPage();
        }
        
    }
    private void LoadForm(int nPlanId)
    {
        ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
        DataSet dsPlan = getPlan.GetKitchenPlanById(nPlanId);
        foreach (DataRow dr in dsPlan.Tables[0].Rows)
        {
            txtPlanContent.Value = dr["PlanText"].ToString();
            //txtPlanContent.Value = HttpUtility.HtmlEncode(dr["PlanText"].ToString());
            txtPlanTitle.Text = dr["PlanTitle"].ToString();
            lblCategory.Text = dr["Category"].ToString();
            //foreach (ListItem item in ddlCategory.Items)
            //{
            //    if (item.Value == dr[""].ToString())
            //    {
            //        item.Selected = true;
            //        break;
            //    }
            //}
            cbActive.Checked = dr["Active"].ToString() == "1" ? true : false;
            hfCustom.Value = dr["CustomPlan"].ToString();
            hfAdditional.Value = dr["IsAdditional"].ToString();
            hfChildId.Value = dr["ChildId"].ToString();
            hfPlanId.Value = dr["KitchenPlanId"].ToString();
            hfPlanCategoryId.Value = dr["PlanCategoryId"].ToString();
        }
    }
    private void LoadKitchenPlan()
    {
        if (m_AdditionalMode == true)
        {
            plan.Active = cbActive.Checked == true ? 1 : 0;
            plan.KitchenId = (int)Session["KitchenId"];
            plan.KitchenPlanCategoryId = Convert.ToInt32(ddlCategory.SelectedValue);           
            plan.PlanText = txtPlanContent.Value;
            plan.PlanTitle = txtPlanTitle.Text;
            plan.Custom = 1;
            plan.Additional = 1;
            plan.ChildPlanId = 0;
            plan.KitchenPlanId = 1; 
          
        }
        else
        {
            plan.Active = cbActive.Checked == true ? 1 : 0;
            plan.KitchenId = (int)Session["KitchenId"];
            plan.KitchenPlanCategoryId = Convert.ToInt32(hfPlanCategoryId.Value);
            plan.KitchenPlanId = int.Parse(hfPlanId.Value);
            plan.PlanText = txtPlanContent.Value;
            plan.PlanTitle = txtPlanTitle.Text;
            plan.Additional = hfAdditional.Value == ""?0: int.Parse(hfAdditional.Value);
            plan.ChildPlanId = hfChildId.Value == "" ? 0 : int.Parse(hfChildId.Value);
            plan.Custom = hfCustom.Value == "" ? 0 : int.Parse(hfCustom.Value);
        }
        
    }
    private void SetPage()
    {
        if (m_UpdateMode == true)
        {
            if (plan.Custom == 1)
            {

                cmdSubmit.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdAdd.Visible = false;
                lkbDefault.Visible = true;
            }
            else
            {
                lkbDefault.Visible = false;
                cmdDelete.Visible = false;
                cmdAdd.Visible = true;
                cmdSubmit.Visible = false;
                cmdCancel.Visible = true;
            }
            
        }
        else
        {
            //Enable all the controls and Revert to Default button            
            lkbDefault.Visible = false;
            cmdDelete.Visible = false;
            cmdAdd.Visible = true;
            cmdSubmit.Visible = false;
            cmdCancel.Visible = true;
            m_AdditionalMode = true;
            lblCategory.Visible = false;
            ddlCategory.Visible = true;
            rfvCategory.Enabled = true;
        }
        if (Request.QueryString["PlanCategoryId"] != null)
        {
            ddlCategory.SelectedValue = Request.QueryString["PlanCategoryId"];
        }
        //txtPlanContent.Value = "";
        //txtPlanTitle.Text = "";
        //cbActive.Checked = false;

    }
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        LoadKitchenPlan();
        plan.Custom = 1;
        plan.Additional = m_AdditionalMode == true?1:0;
        ProcessCreateKitchenPlan createPlan = new ProcessCreateKitchenPlan();
        createPlan.KitchenPlan = plan;
        createPlan.Invoke();
        Response.Redirect("~/ControlPanel/Kitchen/PlanIndexNew.aspx");
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        LoadKitchenPlan();
        plan.Custom = 1;
        ProcessSetKitchenPlan setPlan = new ProcessSetKitchenPlan();
        setPlan.KitchenPlan = plan;
        setPlan.Invoke();
        Response.Redirect("~/ControlPanel/Kitchen/PlanIndexNew.aspx");
    }
    protected void cmdDelete_Click(object sender, EventArgs e)
    {
        LoadKitchenPlan();
        ProcessDeleteKitchenPlan deletePlan = new ProcessDeleteKitchenPlan();
        deletePlan.KitchenPlan = plan;
        deletePlan.Invoke();
        Response.Redirect("~/ControlPanel/Kitchen/PlanIndexNew.aspx");
    }
    protected void cmdCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/PlanIndexNew.aspx");

    }
    protected void lkbCustomize_Command(object sender, CommandEventArgs e)
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
    protected void lkbDefault_Command(object sender, CommandEventArgs e)
    {
        LoadKitchenPlan();
        if (plan.Custom == 1)
        {
            ProcessDeleteKitchenPlan deletePlan = new ProcessDeleteKitchenPlan();
            deletePlan.KitchenPlan = plan;
            deletePlan.Invoke();
        }
        Response.Redirect("~/ControlPanel/Kitchen/PlanIndexNew.aspx");
    }
}
