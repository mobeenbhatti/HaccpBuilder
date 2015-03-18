using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;

namespace HaccpBuilder.ControlPanel.District
{
    public partial class CTpatGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (lblInfo.Visible == true)
            {
                lblInfo.Visible = false;
            }

        }
        protected void btnBack_Click(object sender, ImageClickEventArgs e)
        {

        }
        protected void cmdSearch_Click(object sender, EventArgs e)
        {
            if (txtCtpatGroup.Text != "")
            {
                ProcessGetCtpatGroup getCtpatGroup = new ProcessGetCtpatGroup();
                DataSet dsCtpatGroup = getCtpatGroup.GetCtpatGroupByName((int)Session["DistrictId"], txtCtpatGroup.Text);
                if (dsCtpatGroup.Tables[0].Rows.Count > 0)
                {
                    lblInfo.Text = " Ctpat Group Already Exists";
                    lblInfo.Visible = true;
                }
                else
                {
                    CtpatGroup newCtpatGroup = new CtpatGroup();
                    newCtpatGroup.DistrictId = (int)Session["DistrictId"];
                    newCtpatGroup.GroupName = txtCtpatGroup.Text;

                    ProcessCreateCtpatGroup createCtpatGroup = new ProcessCreateCtpatGroup();
                    createCtpatGroup.CtpatGroup = newCtpatGroup;
                    createCtpatGroup.Invoke();
                    txtCtpatGroup.Text = "";
                    grdCtpatGroup.DataBind();
                }
            }
            else
            {
                lblInfo.Text = "Please Enter Ctpat Group Name";
                lblInfo.Visible = true;
            }

        }
        protected void btnCreateCustomCtpat_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/CustomCtpat.aspx");
        }
        protected void btnEditCtpatGroup_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
        }
    }
}