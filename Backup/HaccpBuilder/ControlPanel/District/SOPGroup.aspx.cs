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

public partial class ControlPanel_District_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lblInfo.Visible == true)
        {
            lblInfo.Visible = false;
        }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {

    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        if (txtSOPGroup.Text != "")
        {
            ProcessGetSOPGroup getSOPGroup = new ProcessGetSOPGroup();
            DataSet dsSOPGroup = getSOPGroup.GetSOPGroupByName((int)Session["DistrictId"], txtSOPGroup.Text);
            if (dsSOPGroup.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = " SOP Group Already Exists";
                lblInfo.Visible = true;
            }
            else
            {
                SOPGroup newSOPGroup = new SOPGroup();
                newSOPGroup.DistrictId = (int)Session["DistrictId"];
                newSOPGroup.GroupName = txtSOPGroup.Text;

                ProcessCreateSOPGroup createSOPGroup = new ProcessCreateSOPGroup();
                createSOPGroup.SOPGroup = newSOPGroup;
                createSOPGroup.Invoke();
                txtSOPGroup.Text = "";
                grdSOPGroup.DataBind();
            }
        }
        else
        {
            lblInfo.Text = "Please Enter SOP Group Name";
            lblInfo.Visible = true ;
        }

    }
    protected void btnCreateCustomSOP_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomSOP.aspx");
    }
    protected void btnEditSOPGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
}
