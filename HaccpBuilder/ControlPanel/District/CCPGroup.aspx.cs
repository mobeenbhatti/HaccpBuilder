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
using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;


public partial class ControlPanel_District_CCPGroup : System.Web.UI.Page
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
        if (txtCCPGroup.Text != "")
        {
            ProcessGetCCPGroup getCCPGroup = new ProcessGetCCPGroup();
            DataSet dsCCPGroup = getCCPGroup.GetCCPGroupByName((int)Session["DistrictId"], txtCCPGroup.Text);
            if (dsCCPGroup.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = " CCP Group Already Exists";
                lblInfo.Visible = true;
            }
            else
            {
                CCPGroup newCCPGroup = new CCPGroup();
                newCCPGroup.DistrictId = (int)Session["DistrictId"];
                newCCPGroup.GroupName = txtCCPGroup.Text;

                ProcessCreateCCPGroup createCCPGroup = new ProcessCreateCCPGroup();
                createCCPGroup.CCPGroup = newCCPGroup;
                createCCPGroup.Invoke();
                txtCCPGroup.Text = "";
                grdCCPGroup.DataBind();
            }
        }
        else
        {
            lblInfo.Text = "Please Enter CCP Group Name";
            lblInfo.Visible = true;
        }

    }
    protected void btnCreateCustomCCP_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    protected void btnEditCCPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
}
