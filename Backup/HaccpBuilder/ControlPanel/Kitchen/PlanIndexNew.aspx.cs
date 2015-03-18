using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Web.UI.HtmlControls;
//using DataModel;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class PlanIndexNew1 : System.Web.UI.Page
    {
       // private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TypeId == 7)
                Response.Redirect("~/ControlPanel/Kitchen/ErrorPage.aspx");

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


            if (lblId != null && lblMenuItem != null)
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

            SchoolHaccp.Common.KitchenPlan plan = new SchoolHaccp.Common.KitchenPlan();
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

           
        }

        protected void lkbSenitazation_Command(object sender, CommandEventArgs e)
        {
            ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
            DataSet dsPlan = getPlan.GetKitchenPlanById((int)Session["KitchenId"]);
            if (dsPlan.Tables[0].Rows.Count < 1)
            {
                ProcessCreateKitchenPlan createPlan = new ProcessCreateKitchenPlan();
                SchoolHaccp.Common.KitchenPlan plan = new SchoolHaccp.Common.KitchenPlan();
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
          

        }      
       
        protected void rptKitchenPlanCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
                HiddenField hfCategoryId = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
                HiddenField hfCustom = (HiddenField)e.Item.FindControl("hfCustom");
                LinkButton lkbDeleteTitle = (LinkButton)e.Item.FindControl("cmdDeleteTitle");
                Repeater rptKitchenPlan = (Repeater)e.Item.FindControl("rptKitchenPlan");
                int nPlanCategoryId = int.Parse(hfCategoryId.Value);
                if (hfCustom != null && hfCustom.Value != "")
                    lkbDeleteTitle.Visible = true;
                DataSet dsKitchenPlans = getPlan.GetKitchenPlanByCategoryId(nPlanCategoryId, (int)Session["KitchenId"]);
                rptKitchenPlan.DataSource = dsKitchenPlans;
                rptKitchenPlan.DataBind();

               
            }
        }
        protected void rptKitchenPlan_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {

                HiddenField hfCustomPlan = (HiddenField)e.Item.FindControl("hfCustomPlan");
                HiddenField hfPlanCategoryId = (HiddenField)e.Item.FindControl("hfPlanCategoryId");
                HiddenField hfActive = (HiddenField)e.Item.FindControl("hfPlanActive");
                // Label lkbExample = (Label)e.Item.FindControl("lblMessage");
                HtmlAnchor lkbPlanTitle = (HtmlAnchor)e.Item.FindControl("lkbKitchenPlan");
                LinkButton lkbExample = (LinkButton)e.Item.FindControl("cmdExample");
                HyperLink hlManagerCheckilist = (HyperLink)e.Item.FindControl("hlManagerChecklist");
                if (hfPlanCategoryId.Value == "9" && (lkbPlanTitle.InnerText.Trim() != "Review Policy" && lkbPlanTitle.InnerText.Trim() != "Monitoring Policy"))
                {
                    hlManagerCheckilist.Visible = true;
                 
                }
                if (hfActive.Value == "0")
                {
                    lkbPlanTitle.Disabled = true;
                }
                // For Free Trial
                if (TypeId == 1)
                {
                    lkbExample.Enabled = false;
                    lkbExample.Attributes.Add("title", "This feature is not available for Free Trial Accounts");
                }
                else
                {
                    lkbExample.Attributes.Add("title", "View Example/Default document");
                }
            }
        }
        protected void rptKitchenPlan_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string strPlanId;
            strPlanId = e.CommandArgument.ToString();
            HiddenField hfCustomPlan = (HiddenField)e.Item.FindControl("hfCustomPlan");
            DataSet dsPlan = new DataSet();
            //if (e.CommandName == "View")
            //{
            ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
            if(hfCustomPlan.Value != null)
                if (hfCustomPlan.Value == "1")
                {
                    dsPlan = getPlan.GetKitchenPlanByChildId(int.Parse(strPlanId));
                }
                else
                {
                    dsPlan = getPlan.GetKitchenPlanById(int.Parse(strPlanId));
                }

            //}
            //if (e.CommandName == "Example")
            //{
            //    ProcessGetKitchenPlan getPlan = new ProcessGetKitchenPlan();
            //    dsPlan = getPlan.GetKitchenPlanExampleById(int.Parse(strPlanId));


            //}
            foreach (DataRow dr in dsPlan.Tables[0].Rows)
            {
                dvKitchenPlanText.InnerHtml = dr["PlanText"].ToString();
            }
            ModalPopupExtender1.PopupControlID = divPlans.ID;
            ModalPopupExtender1.PopupDragHandleControlID = panelPlans.ID;
            ModalPopupExtender1.Show();
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

        protected void Repeater5_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string strPlanCategoryId;
            strPlanCategoryId = e.CommandArgument.ToString();
            Label lblTitle = (Label)e.Item.FindControl("lblTitle");
            HiddenField hfCustomPlan = (HiddenField)e.Item.FindControl("hfCustom");
            HiddenField hfPlanCategory = (HiddenField)e.Item.FindControl("hfPlanCategoryId");
            HiddenField hfKitchenPlanCategory = (HiddenField)e.Item.FindControl("hfKitchenPlanCategoryId");
            HiddenField hfSortId = (HiddenField)e.Item.FindControl("hfSortId");
            HiddenField hfSubId = (HiddenField)e.Item.FindControl("hfSubId");


           if (e.CommandName == "CategoryTitle")
            {
                hfPlanCategoryId.Value = hfPlanCategory.Value;
                hfKitchenPlanCategoryId.Value = hfKitchenPlanCategory.Value;
                hfCustomPlanCategory.Value = hfCustomPlan.Value;
                hfPlanCategorySortId.Value = hfSortId.Value;
                hfPlanCategorySubId.Value = hfSubId.Value;
                txtCategoryTitle.Text = lblTitle.Text;
                ModalPopupExtender1.PopupControlID = dvPlanCategoryTitle.ID;
                ModalPopupExtender1.PopupDragHandleControlID = panelCategoryTitle.ID;
                ModalPopupExtender1.Show();
            }
           if (e.CommandName == "DeleteCategoryTitle")
           {
               KitchenPlanCategory planCategory = new KitchenPlanCategory();
               planCategory.KitchenId = (int)Session["KitchenID"];
               planCategory.KitchenPlanCategoryId = int.Parse(hfKitchenPlanCategory.Value);
               ProcessDeleteKitchenPlanCategory deleteKitchenPlanCategory = new ProcessDeleteKitchenPlanCategory();
               deleteKitchenPlanCategory.KitchenPlanCategory = planCategory;
               deleteKitchenPlanCategory.Invoke();
               rptKitchenPlanCategory.DataBind();
               Repeater5.DataBind();
           }
        }

        protected void cmdCategoryTitle_Click(object sender, EventArgs e)
        {
            int PlanCategoryID = int.Parse(hfPlanCategoryId.Value);
            int KitchenPlanCategoryID = int.Parse(hfKitchenPlanCategoryId.Value);
          
            ProcessCreateKitchenPlanCategory createKitchenPlanCategory = new ProcessCreateKitchenPlanCategory();
            createKitchenPlanCategory.CreateKitchenPlanCategoryCustom((int)Session["KitchenId"], KitchenPlanCategoryID, txtCategoryTitle.Text);
            rptKitchenPlanCategory.DataBind();
            Repeater5.DataBind();
            //DataModel.KitchenPlanCategory kitchenCategory = (from p in context.KitchenPlanCategories
            //                                                 where p.KitchenPlanCategoryId == KitchenPlanCategoryID
            //                                                 select p).FirstOrDefault();
            //if (hfCustomPlanCategory.Value == "")
            //{
            //    PlanIndexCategory category = new PlanIndexCategory();
            //    category.Active = 1;
            //    category.Name = txtCategoryTitle.Text;
            //    category.SortOrder = int.Parse(hfPlanCategorySortId.Value);
            //    category.SubId = int.Parse(hfPlanCategorySubId.Value);
            //    context.PlanIndexCategories.AddObject(category);
            //    context.SaveChanges();
            //    newPlanCategoryID = category.PlanCategoryID;

                
            //    kitchenCategory.ChildId = newPlanCategoryID;

            //    DataModel.KitchenPlanCategory newKitchenCategory = new DataModel.KitchenPlanCategory();
            //    newKitchenCategory.CustomPlanCategory = 1;
            //    newKitchenCategory.KitchenId = (int)Session["KitchenId"];
            //    newKitchenCategory.PlanCategoryID = newPlanCategoryID;
            //    context.KitchenPlanCategories.AddObject(newKitchenCategory);
            //   // context.SaveChanges();

            //    PlanIndexDoc doc = new PlanIndexDoc();
            //    doc.Active = 1;
            //    doc.PlanCategoryId = 89;
            //    doc.PlanID = 2;
            //    doc.PlanText = "test";
            //    doc.PlanTitle = "Entry Date Issue";
            //    doc.SortOrder = 99;
            //    context.PlanIndexDocs.AddObject(doc);
            //    //var docs = (from d in context.PlanIndexDocs
            //    //            where d.PlanCategoryId == PlanCategoryID
            //    //            select d).ToList();
            //    //foreach (var doc in docs)
            //    //{
            //    //    doc.PlanCategoryId = newPlanCategoryID;
                    
            //    //    context.PlanIndexDocs.AddObject(doc);
            //    //}
            //    context.SaveChanges();
            //}
            //else
            //{
            //    PlanIndexCategory category = (from c in context.PlanIndexCategories
            //                                  where c.PlanCategoryID == PlanCategoryID
            //                                  select c).FirstOrDefault();
            //    category.Name = txtCategoryTitle.Text;
            //    context.SaveChanges();
            //}

        }
    }
}