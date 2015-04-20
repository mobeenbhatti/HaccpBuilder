using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class LogsAndChecklist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToShortDateString();  
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