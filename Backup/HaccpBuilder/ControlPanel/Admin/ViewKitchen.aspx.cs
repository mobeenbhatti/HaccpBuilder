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

public partial class ControlPanel_Admin_ViewKitchen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdSearchByKitchenUser_Click(object sender, EventArgs e)
    {
        if (txtKitchenUser.Text != "")
        {
            DataSet dsKitchen;
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            dsKitchen = getKitchen.GetKitchensByUserName(txtKitchenUser.Text);
            if (dsKitchen.Tables[0].Rows.Count > 0)
            {
                grdKitchenSearch.DataSource = dsKitchen;
                grdKitchenSearch.DataBind();
                grdKitchenSearch.Visible = true;
                grdKitchen.Visible = false;
                lblInfo.Visible = false;
            }
            else
            {
                lblInfo.Visible = true;
                lblInfo.Text = "No Data Found";
                grdKitchenSearch.Visible = false;
            }
        }
        else
        {
            lblInfo.Visible = true;
            lblInfo.Text = "Please enter User Name";
        }

    }
    protected void cmdSearchByKitchen_Click(object sender, EventArgs e)
    {
        if (txtKitchen.Text != "")
        {
            DataSet dsKitchen;
            ProcessGetKitchen getKitchen = new ProcessGetKitchen();
            dsKitchen = getKitchen.GetKitchensByName(txtKitchen.Text);
            if (dsKitchen.Tables[0].Rows.Count > 0)
            {
                grdKitchenSearch.DataSource = dsKitchen;
                grdKitchenSearch.DataBind();
                grdKitchenSearch.Visible = true;
                grdKitchen.Visible = false;
                lblInfo.Visible = false;
            }
            else
            {
                lblInfo.Visible = true;
                lblInfo.Text = "No Data Found";
                grdKitchenSearch.Visible = false;
            }
        }
        else
        {
            lblInfo.Visible = true;
            lblInfo.Text = "Please enter Kitchen Name";
        }


    }
    protected void grdKitchen_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            // get the categoryID of the clicked row

            int nKitchenId = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            ProcessDeleteKitchen deleteKitchen = new ProcessDeleteKitchen();
            deleteKitchen.Invoke(nKitchenId);
            grdKitchen.DataBind();

        }
       
    }
    protected void grdKitchenSearch_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            // get the categoryID of the clicked row

            int nKitchenId = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            ProcessDeleteKitchen deleteKitchen = new ProcessDeleteKitchen();
            deleteKitchen.Invoke(nKitchenId);
            grdKitchenSearch.DataBind();

        }
    }
}
