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

public partial class ControlPanel_District_FoodCategoryGroup : System.Web.UI.Page
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
        if (txtFoodCategoryGroup.Text != "")
        {
            ProcessGetFoodCategoryGroup getFoodCategoryGroup = new ProcessGetFoodCategoryGroup();
            DataSet dsFoodCategoryGroup = getFoodCategoryGroup.GetFoodCategoryGroupByName((int)Session["DistrictId"], txtFoodCategoryGroup.Text);
            if (dsFoodCategoryGroup.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = " FoodCategory Group Already Exists";
                lblInfo.Visible = true;
            }
            else
            {
                FoodCategoryGroup newFoodCategoryGroup = new FoodCategoryGroup();
                newFoodCategoryGroup.DistrictId = (int)Session["DistrictId"];
                newFoodCategoryGroup.GroupName = txtFoodCategoryGroup.Text;

                ProcessCreateFoodCategoryGroup createFoodCategoryGroup = new ProcessCreateFoodCategoryGroup();
                createFoodCategoryGroup.FoodCategoryGroup = newFoodCategoryGroup;
                createFoodCategoryGroup.Invoke();
                txtFoodCategoryGroup.Text = "";
                grdFoodCategoryGroup.DataBind();
            }
        }
        else
        {
            lblInfo.Text = "Please Enter FoodCategory Group Name";
            lblInfo.Visible = true;
        }

    }
    protected void btnCreateCustomFoodCategory_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomFoodCategory.aspx");
    }
    protected void btnEditFoodCategoryGroup_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
}
