using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_District_ProcessGroup : System.Web.UI.Page
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
        if (txtProcessGroup.Text != "")
        {
            ProcessGetProcessGroup getProcessGroup = new ProcessGetProcessGroup();
            DataSet dsProcessGroup = getProcessGroup.GetProcessGroupByName((int)Session["DistrictId"], txtProcessGroup.Text);
            if (dsProcessGroup.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = " Process Group Already Exists";
                lblInfo.Visible = true;
            }
            else
            {
                ProcessGroup newProcessGroup = new ProcessGroup();
                newProcessGroup.DistrictId = (int)Session["DistrictId"];
                newProcessGroup.GroupName = txtProcessGroup.Text;

                ProcessCreateProcessGroup createProcessGroup = new ProcessCreateProcessGroup();
                createProcessGroup.ProcessGroup = newProcessGroup;
                createProcessGroup.Invoke();
                txtProcessGroup.Text = "";
                grdProcessGroup.DataBind();
            }
        }
        else
        {
            lblInfo.Text = "Please Enter Process Group Name";
            lblInfo.Visible = true;
        }

    }
    protected void btnCreateCustomProcess_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomProcess.aspx");
    }
    protected void btnEditProcessGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
}
