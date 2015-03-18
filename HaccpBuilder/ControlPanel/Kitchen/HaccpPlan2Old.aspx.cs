using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using System.Web.UI;

public partial class ControlPanel_Kitchen_HaccpPlan2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdMenuAll_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblPreparation = (Label)e.Row.FindControl("lblPreperation");
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
                lblPreparation.Visible = false;
                lblPreparation.Text = string.Empty;


                //titleLabel.Visible = false;
                //titleLabel.Text = string.Empty;
            }
            else
            {
                title = strval;
                ViewState["title"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                lblPreparation.Visible = true;
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
            dtvProcess.DataSource = getProcess.GetProcessByID(int.Parse(hfProcessId.Value));
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
    protected void grdMenuProcess1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            Label lblPreparation = (Label)e.Row.FindControl("lblPreperation");
     


            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title0"];
            string processTitle = lblProcess.Text;
            string strProcess = (string)ViewState["process0"];
            if (title == strval)
            {
                lblMenuItem.Visible = false;
                lblMenuItem.Text = string.Empty;
                lblProcess.Visible = false;
                lblProcess.Text = string.Empty;
                lblPreparation.Visible = false;
                lblPreparation.Text = string.Empty;
                
            }
            else
            {
                title = strval;

                ViewState["title0"] = title;
                if (strProcess == processTitle)
                {
                    //e.Row.FindControl("dvPageBreak").Visible = true;
                    e.Row.Style.Add("page-break-before", "always");
                    //lblMenuItem.Style.Add("page-break-before", "always");
                }
                strProcess = processTitle;
                ViewState["process0"] = strProcess;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                lblPreparation.Visible = true;
                


                
            }
        }
    }
}
