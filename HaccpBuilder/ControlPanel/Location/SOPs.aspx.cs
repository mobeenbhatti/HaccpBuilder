using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class SOPs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
}