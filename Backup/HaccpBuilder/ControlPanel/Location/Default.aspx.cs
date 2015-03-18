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
using eWorld.UI;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_Location_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToShortDateString();        
    //    BindSectionsData();
        if (this.IsPostBack != true)
        {     
           // hlUserGuide.NavigateUrl = "~/StaticContent/Files/HACCP Builder Instruction Guide.pdf";
            if (TypeId == 7)
            {
                rptCtpat.DataSource = sqlDsCtpat;
                rptCtpat.DataBind();
            }
            else
            {
                if (TypeId == 8)
                {
                    rptCtpat.DataSource = sqlDsCtpat;
                    rptCtpat.DataBind();
                }
                rptSop.DataSource = sqlDSSOP;
                rptSop.DataBind();
            }
        }
    }
    protected void rptReports_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {

            HyperLink hlTask = (HyperLink)e.Item.FindControl("hlTableName");

            ///////////////////////////////////////////
            // HIDE INFORMATION ON BASIS OF KITCHEN TYPE
            ///////////////////////////////////////////
            // Command Central Location - 6
            // HBFlex With Reporting - 5
            // HBFlex without Reporting - 3
            // Free Trial - 1
            if (TypeId == 2 || TypeId == 3)
            {
                // Disable Reporting
                hlTask.Enabled = false;
            }
           
            // DISABLE REPORTING
            if (DataBinder.Eval(e.Item.DataItem, "Report").ToString() == "0")
            {
                hlTask.Enabled = false;               
            }
        }

    }
    protected void rptWeekly_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {


            HyperLink hlTask = (HyperLink)e.Item.FindControl("hlTableName");         

           
            ///////////////////////////////////////////
            // HIDE INFORMATION ON BASIS OF KITCHEN TYPE
            ///////////////////////////////////////////
            if (TypeId == 2 || TypeId == 3)
            {
                hlTask.Enabled = false;               

            }
            if (DataBinder.Eval(e.Item.DataItem, "Report").ToString() == "0")
            {
                hlTask.Enabled = false;                
            }           
        }

    }

    protected void rptOther_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            HyperLink hlTask = (HyperLink)e.Item.FindControl("hlTableName");
            
           
            /////////////////////////////////////
            if (TypeId == 2 || TypeId == 3)
            {
                hlTask.Enabled = false;              
            }
            if (DataBinder.Eval(e.Item.DataItem, "Report").ToString() == "0")
            {
                hlTask.Enabled = false;               
            }
        }        
    }

    protected void ddlMenuItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Location/MenuRecipePrint.aspx?MenuId=" + ddlMenuItem.SelectedValue);
    }
    public int TypeId
    {
        get
        {
            if (Session["TypeId"] != null)
                return (int)Session["TypeId"];
            else
            {
                Response.Redirect("~/ControlPanel/LogOut.aspx");
                return 0;
            }

        }
    }
}
