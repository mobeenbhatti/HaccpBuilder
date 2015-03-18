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

public partial class ControlPanel_District_ValidationGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (lblInfo.Visible == true)
        {
            lblInfo.Visible = false;
        }

    }

    protected void btnAddKitchen_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
    protected void btnCreateCustomQuestion_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/ValidationCustomQuestion.aspx");
    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        if (txtCheckListGroup.Text != "")
        {
            ProcessGetValidationGroup getValidationGroup = new ProcessGetValidationGroup();
            //ProcessGetCheckListGroup getCheckListGroup = new ProcessGetCheckListGroup();
            DataSet dsCheckListGroup = getValidationGroup.GetValidationGroupByName((int)Session["DistrictId"], txtCheckListGroup.Text);
           //     getCheckListGroup.GetCheckListGroupByName((int)Session["DistrictId"], txtCheckListGroup.Text);
            if (dsCheckListGroup.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = " Validation Group Already Exists";
                lblInfo.Visible = true;
            }
            else
            {
                ValidationGroup newValidationGroup = new ValidationGroup();
                newValidationGroup.DistrictId = (int)Session["DistrictId"];
                newValidationGroup.GroupName = txtCheckListGroup.Text;

                //CheckListGroup newCheckListGroup = new CheckListGroup();
                //newCheckListGroup.DistrictId = (int)Session["DistrictId"];
                //newCheckListGroup.GroupName = txtCheckListGroup.Text;

                ProcessCreateValidationGroup createValidatoinGroup = new ProcessCreateValidationGroup();
                createValidatoinGroup.ValidationGroup = newValidationGroup;
                createValidatoinGroup.Invoke();

                //ProcessCreateCheckListGroup createCheckListGroup = new ProcessCreateCheckListGroup();
                //createCheckListGroup.CheckListGroup = newCheckListGroup;
                //createCheckListGroup.Invoke();

                txtCheckListGroup.Text = "";
                grdChecklistGroup.DataBind();
            }
        }
        else
        {
            lblInfo.Text = "Please Enter Validation Group Name";
            lblInfo.Visible = true;
        }
       

    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {

    }
}
