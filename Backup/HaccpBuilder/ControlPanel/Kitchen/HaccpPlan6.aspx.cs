using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class HaccpPlan6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
    }
}