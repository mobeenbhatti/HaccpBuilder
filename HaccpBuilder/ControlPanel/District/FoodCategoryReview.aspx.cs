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

using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_District_FoodCategoryReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Request.QueryString["GroupId"] != null)
            {
                ddlKitchen.SelectedValue = Request.QueryString["GroupId"];
               
            }
        }
    }
    protected void cmdContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + Request.QueryString["GroupId"]);
    }

   
    protected void lkbTitle_Click(object sender, EventArgs e)
    {
        LinkButton lkbFoodCategory = sender as LinkButton;
        int nFoodCategoryId = int.Parse(lkbFoodCategory.Text);
        ProcessGetFoodCategory getFoodCategory = new ProcessGetFoodCategory();
        DataSet ds = getFoodCategory.GetFoodCategoryByID(nFoodCategoryId);
        dtvSOP.DataSource = ds;
        dtvSOP.DataBind();
        ModalPopupExtender1.Show();
    }
    protected void grdFoodCategory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "FoodCategory")
        {
            int nFoodCategoryId = int.Parse(e.CommandArgument.ToString());
            ProcessGetFoodCategory getFoodCategory = new ProcessGetFoodCategory();
            DataSet ds = getFoodCategory.GetFoodCategoryByID(nFoodCategoryId);
            dtvSOP.DataSource = ds;
            dtvSOP.DataBind();
            ModalPopupExtender1.Show();
        }
    }
}
