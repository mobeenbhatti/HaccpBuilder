using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_District_ProcessReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Request.QueryString["GroupId"] != null)
            {
                ddlKitchen.DataBind();
                ddlKitchen.SelectedValue = Request.QueryString["GroupId"];
               
            }
        }
    }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + Request.QueryString["GroupId"]);
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {
        // Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");
        Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx");
    }
   
    protected void lkbTitle_Click(object sender, EventArgs e)
    {
        LinkButton lkbProcess = sender as LinkButton;
        int nProcessId = int.Parse(lkbProcess.Text);
        ProcessGetProcess getProcess = new ProcessGetProcess();
        DataSet ds = getProcess.GetProcessByID(nProcessId);
        dtvSOP.DataSource = ds;
        dtvSOP.DataBind();
        ModalPopupExtender1.Show();
    }
    protected void grdProcess_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Process")
        {
            int nProcessId = int.Parse(e.CommandArgument.ToString());
            ProcessGetProcess getProcess = new ProcessGetProcess();
            DataSet ds = getProcess.GetProcessByID(nProcessId);
            dtvSOP.DataSource = ds;
            dtvSOP.DataBind();
            ModalPopupExtender1.Show();
        }
    }
}
