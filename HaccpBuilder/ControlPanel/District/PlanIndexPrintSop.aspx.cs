using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;

namespace HaccpBuilder.ControlPanel.District
{
    public partial class PlanIndexPrintSop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TypeId == 5)
            {
                rptCtpatMain.DataSource = sqlDsCtpat;
                rptCtpatMain.DataBind();
            }
            else
            {
                if (TypeId == 4)
                {
                    rptCtpatMain.DataSource = sqlDsCtpat;
                    rptCtpatMain.DataBind();
                }
                rptSopMain.DataSource = sqlDSSOP;
                rptSopMain.DataBind();
            }
        }
        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptSOP;
                HiddenField hfSOPId;
                ProcessGetSOP getSOP = new ProcessGetSOP();
                rptSOP = (Repeater)e.Item.FindControl("rptSOP");
                hfSOPId = (HiddenField)e.Item.FindControl("hfSOPId");
                rptSOP.DataSource = getSOP.GetSOPById(int.Parse(hfSOPId.Value));
                rptSOP.DataBind();
            }
        }
        protected void rptCtpatMain_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptCtpat;
                HiddenField hfCtpatId;
                ProcessGetCtpat getCtpat = new ProcessGetCtpat();
                rptCtpat = (Repeater)e.Item.FindControl("rptCtpat");
                hfCtpatId = (HiddenField)e.Item.FindControl("hfCtpatId");
                rptCtpat.DataSource = getCtpat.GetCtpatById(int.Parse(hfCtpatId.Value));
                rptCtpat.DataBind();
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