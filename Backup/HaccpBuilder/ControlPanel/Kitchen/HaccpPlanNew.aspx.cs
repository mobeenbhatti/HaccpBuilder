using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel_Kitchen_HaccpPlanNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // for C-TPAT only
        if (TypeId == 7)
        {
            hlHaccpPlan4.Enabled = false;
        }
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
