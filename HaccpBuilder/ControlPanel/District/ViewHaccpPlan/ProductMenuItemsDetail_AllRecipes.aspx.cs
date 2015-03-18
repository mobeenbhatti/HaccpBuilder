using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel_Kitchen_ViewHaccpPlan_ProductMenuItemsDetail_AllRecipes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdMenuAll_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;

                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
}
