using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;

namespace HaccpBuilder.ControlPanel.District
{
    public partial class ChecklistAddOnGroup : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            if (txtCheckListGroup.Text.Trim() != "")
            {
                int GroupId = (int)Session["DistrictId"];
                CheckListAddonGroup getGroup = (from sc in context.CheckListAddonGroups
                                               where sc.CheckListAddonGroupId == GroupId
                                               select sc).FirstOrDefault();
                if (getGroup != null)
                {
                    lblInfo.Text = " Checklist Group Already Exists";
                    lblInfo.Visible = true;
                }
                else
                {
                    CheckListAddonGroup group = new CheckListAddonGroup();
                    group.DistrictId = (int)Session["DistrictId"];
                    group.GroupName = txtCheckListGroup.Text;
                    context.CheckListAddonGroups.AddObject(group);
                    context.SaveChanges();
                    txtCheckListGroup.Text = "";
                    grdChecklistAddOnGroup.DataBind();
                }
            }
            else
            {
                lblInfo.Text = "Please Enter Checklist Group Name";
                lblInfo.Visible = true;
            }
        }
    }
}