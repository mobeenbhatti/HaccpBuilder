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

public partial class ControlPanel_Kitchen_ViewHaccpPlan_SOPs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DetailsView dtvSOP;
            HiddenField hfSOPId;
            ProcessGetSOP getSOP = new ProcessGetSOP();
            dtvSOP = (DetailsView)e.Item.FindControl("dtvSOP");
            hfSOPId = (HiddenField)e.Item.FindControl("hfSOPId");
            //dtvSOP.DataSource = getSOP.GetSOPByKitchenId((int)Session["KitchenId"], int.Parse(hfSOPId.Value));
            dtvSOP.DataSource = getSOP.GetSOPById(int.Parse(hfSOPId.Value));
            dtvSOP.DataBind();
        }
    }
    protected void grdMenuProcess2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblProcess = (Label)e.Row.FindControl("lblProcess");
            Label lblMenuItem = (Label)e.Row.FindControl("lblName");
            //HyperLink hlMenuItem = (HyperLink)e.Row.FindControl("hlName");



            string strval = lblMenuItem.Text;
            string title = (string)ViewState["title1"];
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
                ViewState["title1"] = title;
                lblMenuItem.Visible = true;
                lblProcess.Visible = true;
                //titleLabel.Visible = true;
                //titleLabel.Text = getCategory(title);
            }
        }
    }
}
