using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_Kitchen_MenuRecipePrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack != true)
        {
            

        }
    }
    protected void cmdCancel_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItems.aspx?Id=" + Request.QueryString["MenuId"]);
    }
   
}
