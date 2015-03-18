using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LayoutTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Haccp Builder Package
        if (TypeId == 1)
        {
            pnlCtpat.Visible = false;
        }
        // Haccp Builder + C-TPAT
        if (TypeId == 4)
        {
        }
        // C-Tpat Package
        if (TypeId == 5)
        {
            pnlFoodSafety.Visible = false;
            pnlFoodCategory.Visible = false;
            pnlValidation.Visible = false;
            pnlSop.Visible = false;
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
