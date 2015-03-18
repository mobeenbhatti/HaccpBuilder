using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class InventoryReviewNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TypeId == 7)
                Response.Redirect("~/ControlPanel/Kitchen/ErrorPage.aspx");
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/CustomInventory.aspx");
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        protected void cmdContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Vendors.aspx");
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