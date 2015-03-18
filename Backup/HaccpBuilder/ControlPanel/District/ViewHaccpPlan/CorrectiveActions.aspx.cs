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
using System.IO;

using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_Kitchen_ViewHaccpPlan_corrective_actions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rptFoodCatogary_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            DataSet dsFoodcategoryCorectiveAction;
            HiddenField hfFoodCategoryId;
            Repeater rptFoodcategoryCorectiveAction;

            //Repeater rptFoodcategory;

            System.Web.UI.HtmlControls.HtmlTableRow trFoodCategoryCorrectiveActions;
            //rptFoodcategory = (Repeater)e.Item.FindControl("rptFoodcategory");
            rptFoodcategoryCorectiveAction = (Repeater)e.Item.FindControl("rptFoodcategoryCorectiveAction");
            hfFoodCategoryId = (HiddenField)e.Item.FindControl("hfFoodCategoryId");
            trFoodCategoryCorrectiveActions = (System.Web.UI.HtmlControls.HtmlTableRow)e.Item.FindControl("trFoodCategoryCorrectiveActions");

            ProcessGetFoodCategory processGetFoodCategory = new ProcessGetFoodCategory();

            //rptFoodcategory.DataSource = processGetFoodCategory.GetFoodCategoriesByKitchenId((int)Session["KitchenId"]);
            //rptFoodcategory.DataBind();
            dsFoodcategoryCorectiveAction = processGetFoodCategory.GetFoodCategoryCorrectiveActions(int.Parse(hfFoodCategoryId.Value)); ;
            rptFoodcategoryCorectiveAction.DataSource = dsFoodcategoryCorectiveAction;
            rptFoodcategoryCorectiveAction.DataBind();

            if (dsFoodcategoryCorectiveAction.Tables[0].Rows.Count < 1)
            {
                trFoodCategoryCorrectiveActions.Visible = true;

            }
            else
            {
                trFoodCategoryCorrectiveActions.Visible = false;
            }



        }
    }
}
