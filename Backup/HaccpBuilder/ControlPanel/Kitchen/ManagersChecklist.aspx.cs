using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel_Kitchen_ManagersChecklist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PlanId"] == "1")
        {
            dvSenitization.Visible = true;
        }
        if (Request.QueryString["PlanId"] == "2")
        {
            dvPestControl.Visible = true;
        }
        if (Request.QueryString["PlanId"] == "3")
        {
            dvMaintainenace.Visible = true;
        }

    }
}
