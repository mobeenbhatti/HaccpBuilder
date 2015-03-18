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

public partial class ControlPanel_District_CCPReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Request.QueryString["GroupId"] != null)
            {
                ddlKitchen.DataBind();
                ddlKitchen.SelectedValue = Request.QueryString["GroupId"];
                lblGroupName.Text = ddlKitchen.SelectedItem.Text;
            }
        }
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + Request.QueryString["GroupId"]);
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/DistrictControl.aspx");
    }
    protected void ddlKitchen_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblGroupName.Text = ddlKitchen.SelectedItem.Text;
    }
    protected void lkbTitle_Click(object sender, EventArgs e)
    {
        LinkButton lkbCCP = sender as LinkButton;
        int nCCPId = int.Parse(lkbCCP.Text);
        ProcessGetCCP getCCP = new ProcessGetCCP();
        DataSet ds = getCCP.GetCCPByID(nCCPId);
        dtvSOP.DataSource = ds;
        dtvSOP.DataBind();
        ModalPopupExtender1.Show();
    }
    protected void grdCCP_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "CCP")
        {
            int nCCPId = int.Parse(e.CommandArgument.ToString());
            ProcessGetCCP getCCP = new ProcessGetCCP();
            DataSet ds = getCCP.GetCCPByID(nCCPId);
            dtvSOP.DataSource = ds;
            dtvSOP.DataBind();
            ModalPopupExtender1.Show();
        }
    }
}
