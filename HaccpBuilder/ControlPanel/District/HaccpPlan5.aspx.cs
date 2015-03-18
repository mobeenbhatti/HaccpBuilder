using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_HaccpPlan5 : System.Web.UI.Page
{
    protected ProcessGetMenuRecipe getRecipe;
    protected MenuRecipe recipe;
    protected ProcessGetMenuRecipeDetails getRecipeDetails;
    protected MenuRecipeDetails recipeDetails;
    protected void Page_Load(object sender, EventArgs e)
    {
        recipe = new MenuRecipe();
        recipeDetails = new MenuRecipeDetails();
      getRecipe = new ProcessGetMenuRecipe();     
      getRecipeDetails = new ProcessGetMenuRecipeDetails();
    }
    protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rptRecipe;
            HiddenField hfMenuId;
            GridView grdRecipeDetails;
            


            hfMenuId = (HiddenField)e.Item.FindControl("hfMenuId");
            grdRecipeDetails = (GridView)e.Item.FindControl("grdRecipeDetails");
            rptRecipe = (Repeater)e.Item.FindControl("rptRecipe");


            if (hfMenuId != null)
            {
                recipe.MenuID = int.Parse(hfMenuId.Value);
                getRecipe.MenuRecipe = recipe;
                getRecipe.Invoke();
                rptRecipe.DataSource = getRecipe.ResultSet;
                rptRecipe.DataBind();

                grdRecipeDetails.DataSource = getRecipeDetails.GetMenuRecipeDetailsByMenuId(int.Parse(hfMenuId.Value));
                grdRecipeDetails.DataBind();

                
            }

        }
    }
}
