using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel_District_HaccpPlanNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["KitchenId"] != null)
            {
                Session["KitchenId"] = int.Parse(Request.QueryString["KitchenId"]);
            }
            if (Request.QueryString["Name"] != null)
            {
                lblKitchen.Text = Request.QueryString["Name"];
            }
        }
    }
   
}
