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
using SchoolHaccp.Common;

public partial class ControlPanel_Kitchen_PrintHaccpPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
        DataSet dsFoodItem = menuItems.GetMenuItemsDataSet((int)Session["KitchenId"]);
        //grdMenuItem.DataSource = dsFoodItem;
        //grdMenuItem.DataBind();

    }

    protected void rptMealCalendar_OnItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "ShowHide")
        {

            LinkButton b = (LinkButton)e.CommandSource;

            if (b.Text == "Hide")

                b.Text = "Show";

            else

                b.Text = "Hide";

            ((DataGrid)e.Item.FindControl("DataGrid1")).Visible = (b.Text == "Hide");

        }

    }


}
