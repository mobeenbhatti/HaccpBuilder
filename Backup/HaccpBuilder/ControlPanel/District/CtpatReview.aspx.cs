using System;
using System.Collections.Generic;
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

namespace HaccpBuilder.ControlPanel.District
{
    public partial class CtpatReview : System.Web.UI.Page
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
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/KitchenGroup.aspx?GroupId=" + Request.QueryString["GroupId"]);
        }
        protected void btnBack_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlPanel/District/LayoutTest.aspx");
        }
        protected void ddlKitchen_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}