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

public partial class ControlPanel_Kitchen_ViewHaccpPlan_Process : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdMenuProcess4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title3"];
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
                ViewState["title3"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void grdMenuProcess3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title2"];
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
                ViewState["title2"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
   
    protected void grdMenuProcess1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title0"];
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
                ViewState["title0"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
    protected void rptProcess_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DetailsView dtvProcess;
            HiddenField hfProcessId;
            GridView grdMenu;
            DataSet dsProcessMenu;
            Label lblProcessMenu;

            dtvProcess = (DetailsView)e.Item.FindControl("dtvProcess");
            hfProcessId = (HiddenField)e.Item.FindControl("hfProcessId");
            grdMenu = (GridView)e.Item.FindControl("grdMenuProcess1");
            lblProcessMenu = (Label)e.Item.FindControl("lblProcessMenu");
            ProcessGetProcess getProcess = new ProcessGetProcess();
            dtvProcess.DataSource = getProcess.GetProcessByKitchenId((int)Session["KitchenId"], int.Parse(hfProcessId.Value));
            dtvProcess.DataBind();

            ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();

            dsProcessMenu = getMenuItem.GetMenuItemsNewByProcess((int)Session["KitchenId"], int.Parse(hfProcessId.Value));

            grdMenu.DataSource = dsProcessMenu;
            grdMenu.DataBind();

            if (dsProcessMenu.Tables[0].Rows.Count < 1)
            {
                lblProcessMenu.Text = "No Data Found";
            }

        }
    }
}
