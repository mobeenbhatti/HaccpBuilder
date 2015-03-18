using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_Kitchen_MenuRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
            if(Request.QueryString["MenuId"] != null)
            {
                ProcessSetMenuRecipeDetails setMenuRecipeDetail = new ProcessSetMenuRecipeDetails();
                setMenuRecipeDetail.UpdateIngredients(int.Parse(Request.QueryString["MenuId"]));
            }
            
        }

    }
}
