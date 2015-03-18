using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class MenuRecipeNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack != true)
            {
                if (Request.QueryString["MenuId"] != null)
                {
                    ProcessSetMenuRecipeDetails setMenuRecipeDetail = new ProcessSetMenuRecipeDetails();
                    setMenuRecipeDetail.UpdateIngredients(int.Parse(Request.QueryString["MenuId"]));
                    GetData(int.Parse(Request.QueryString["MenuId"]));
                    hlPrint.NavigateUrl = "~/ControlPanel/Kitchen/MenuRecipePrint.aspx?MenuId=" + Request.QueryString["MenuId"];
                }

            }
        }
        private void GetData(int nMenuId)
        {
            MenuRecipe recipe = new MenuRecipe();
            recipe.MenuID = int.Parse(Request.QueryString["MenuID"]);
            ProcessGetMenuRecipe getRecipe = new ProcessGetMenuRecipe();
            getRecipe.MenuRecipe = recipe;
            getRecipe.Invoke();
            IDataReader drRecipe = getRecipe.ResultSet;
            if (drRecipe.Read())
            {
                hfMenuRecipeId.Value = drRecipe["MenuRecipeId"].ToString();
                txtMenu.Text = drRecipe["Menu"].ToString();
                txtPortion.Text = drRecipe["PortionSize"].ToString();
                txtPreparation.Value = drRecipe["Preparation"].ToString();
                txtWrittenBy.Text = drRecipe["WrittenBy"].ToString();
                txtYield.Text = drRecipe["Yield"].ToString();
                txtDate.Text = DateTime.Today.ToShortDateString();

            }
            GetMenuRecipeDetailsData();

        }
        private void GetMenuRecipeDetailsData()
        {
            ProcessGetMenuRecipeDetails getRecipeDetails = new ProcessGetMenuRecipeDetails();
            DataSet dsRecipeDetails = getRecipeDetails.GetMenuRecipeDetailsByMenuId(int.Parse(Request.QueryString["MenuID"]));
            grdIngredient.DataSource = dsRecipeDetails;
            grdIngredient.DataBind();
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            SaveData();
            Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + Request.QueryString["MenuId"]);
        }
        private void SaveData()
        {
            MenuRecipe recipe = new MenuRecipe();
            MenuRecipeDetails recipeDetails = new MenuRecipeDetails();
            ProcessSetMenuRecipe setRecipe = new ProcessSetMenuRecipe();
            ProcessSetMenuRecipeDetails setRecipeDetails = new ProcessSetMenuRecipeDetails();

            recipe.MenuID = int.Parse(Request.QueryString["MenuId"]);
            recipe.PortionSize = txtPortion.Text;
            recipe.Preparation = txtPreparation.Value;
            recipe.WrittenBy = txtWrittenBy.Text;
            recipe.Yield = txtYield.Text;
            setRecipe.MenuRecipe = recipe;
            setRecipe.Invoke();

            TextBox txtSpecs, txtEpWeight, txtEpVolume, txtEPPercent;
            HiddenField hfMenuRecipeDetailId, hfIngredientId, hfSortOrder;

            foreach (GridViewRow row in grdIngredient.Rows)
            {
                txtSpecs = (TextBox)row.FindControl("txtSpecs");
                txtEpWeight = (TextBox)row.FindControl("txtEpWeight");
                txtEpVolume = (TextBox)row.FindControl("txtEpVolume");
                txtEPPercent = (TextBox)row.FindControl("txtEPPercent");
                hfMenuRecipeDetailId = (HiddenField)row.FindControl("hfMenuRecipeDetailId");
                hfIngredientId = (HiddenField)row.FindControl("hfIngredientId");
                hfSortOrder = (HiddenField)row.FindControl("hfSortOrder");
                if (txtSpecs != null && hfMenuRecipeDetailId != null)
                {
                    recipeDetails.EPPercentage = txtEPPercent.Text;
                    recipeDetails.EPVolume = txtEpVolume.Text;
                    recipeDetails.EPWeight = txtEpWeight.Text;
                    recipeDetails.IngredientID = int.Parse(hfIngredientId.Value);
                    recipeDetails.MenuRecipeDetailID = int.Parse(hfMenuRecipeDetailId.Value);
                    recipeDetails.MenuRecipeID = int.Parse(hfMenuRecipeId.Value);
                    recipeDetails.SortOrder = int.Parse(hfSortOrder.Value);
                    recipeDetails.Specs = txtSpecs.Text;

                    setRecipeDetails.MenuRecipeDetails = recipeDetails;
                    setRecipeDetails.Invoke();

                }
            }
        }
        private void RemoveData()
        {
            MenuRecipe recipe = new MenuRecipe();
            ProcessDeleteMenuRecipe deleteRecipe = new ProcessDeleteMenuRecipe();
            recipe.MenuRecipeID = int.Parse(hfMenuRecipeId.Value);
            deleteRecipe.MenuRecipe = recipe;
            deleteRecipe.Invoke();
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            RemoveData();
            Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + Request.QueryString["MenuId"]);
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + Request.QueryString["MenuId"]);
        }
        protected void grdIngredient_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int nTotalRecords = grdIngredient.Rows.Count;
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            if (e.CommandName == "Up" && (grdIngredient.Rows.Count > 1 && row.RowIndex > 0))
            {
                int nOriginalRecipeId, nNewRecipeId;
                row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                nOriginalRecipeId = Convert.ToInt32(grdIngredient.DataKeys[row.RowIndex].Value);
                nNewRecipeId = Convert.ToInt32(grdIngredient.DataKeys[row.RowIndex - 1].Value);
                updateSortOrder(nOriginalRecipeId, nNewRecipeId);

            }
            //row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            if (e.CommandName == "Down" && (grdIngredient.Rows.Count > 1 && row.RowIndex < nTotalRecords - 1))
            {
                int nOriginalRecipeId, nNewRecipeId;
                nOriginalRecipeId = Convert.ToInt32(grdIngredient.DataKeys[row.RowIndex].Value);
                nNewRecipeId = Convert.ToInt32(grdIngredient.DataKeys[row.RowIndex + 1].Value);
                updateSortOrder(nOriginalRecipeId, nNewRecipeId);

            }
        }
        protected void updateSortOrder(int nOriginalId, int nNewId)
        {
            ProcessSetMenuRecipeDetails setRecipeDetails = new ProcessSetMenuRecipeDetails();
            setRecipeDetails.UpdateSortOrder(nOriginalId, nNewId);
            GetMenuRecipeDetailsData();

        }
        protected void cmdPrint_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/MenuRecipePrint.aspx?MenuId=" + Request.QueryString["MenuId"]);
        }
    }
}