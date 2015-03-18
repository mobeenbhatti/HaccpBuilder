using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;

namespace HaccpBuilder.ControlPanel.District
{
    public partial class ChecklistSections : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["GroupId"] != null)
                {
                    ddlChecklistGroup.SelectedValue = Request.QueryString["GroupId"];
                    GetData();
                }
            }
        }
        protected void ddlChecklistGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
           GetData();
        }

        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            if (txtSectionName.Text.Trim() != "" && ddlChecklistGroup.SelectedIndex  > 0)
            {               
                string SectionName = txtSectionName.Text;
                ChecklistSection getSection = (from sc in context.ChecklistSections
                                           where sc.ChecklistGroupId == GroupId && sc.Name == SectionName
                                           select sc).FirstOrDefault();
                if (getSection != null)
                {
                    lblInfo.Text = " Checklist Section Already Exists";
                    lblInfo.Visible = true;
                }
                else
                {
                    ChecklistSection section = new ChecklistSection();
                    section.ChecklistGroupId = GroupId;
                    section.Name = txtSectionName.Text;                   
                    context.ChecklistSections.AddObject(section);
                    context.SaveChanges();
                    txtSectionName.Text = "";
                    grdChecklistAddOnGroup.DataBind();
                }
                GetData();
            }
            else
            {
                lblInfo.Text = "Please Enter Checklist Section Name";
                lblInfo.Visible = true;
            }
        }
        protected void grdChecklistAddOnGroup_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                if (e.CommandName == "EditSection")
                {
                    hfSectionId.Value = e.CommandArgument.ToString();
                    int nSectionId = int.Parse(e.CommandArgument.ToString());
                    ChecklistSection section = (from ad in context.ChecklistSections
                                                where ad.CheckListSectionId == nSectionId
                                                select ad).FirstOrDefault();
                    FillForm(section);
                    ModalPopupExtender1.PopupControlID = "divPopup";
                    ModalPopupExtender1.Show();

                }
            }

        }
        protected void cmdGo_Click(object sender, EventArgs e)
        {
            if (hfSectionId.Value != "")            
            {

                UpdateItem(int.Parse(hfSectionId.Value));
            }
            GetData();

        }
#region Properties
        int GroupId
        {
            get
            {
                if (ddlChecklistGroup.SelectedIndex > 0)
                {
                    return int.Parse(ddlChecklistGroup.SelectedValue);
                }
                else
                {
                    if (Request.QueryString["GroupId"] != "")
                    {
                        return int.Parse(Request.QueryString["GroupId"]);
                    }
                    else
                    {
                        return 1;
                    }
                }
            }
        }
#endregion
        #region Methods
        private void GetData()
        {
                        
            List<ChecklistSection> sections = (from dt in context.ChecklistSections
                                               where dt.ChecklistGroupId == GroupId
                                               select dt).ToList();
            grdChecklistAddOnGroup.DataSource = sections;
            grdChecklistAddOnGroup.DataBind();
        }
        private void FillForm(ChecklistSection section)
        {
            txtSection.Text = section.Name;
            hfSectionId.Value = section.CheckListSectionId.ToString();

        }
        private void UpdateItem(int nSectionId)
        {
            ChecklistSection section = (from ad in context.ChecklistSections
                                          where ad.CheckListSectionId == nSectionId
                                          select ad).FirstOrDefault();
            GetFormValues(section);
            context.SaveChanges();
        }
        private void GetFormValues(ChecklistSection section)
        {

            section.Name = txtSection.Text;
            
        }
        #endregion

        

    }
}