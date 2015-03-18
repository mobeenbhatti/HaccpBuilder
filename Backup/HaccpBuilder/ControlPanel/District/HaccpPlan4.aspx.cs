using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.BusinessLogic;

public partial class ControlPanel_District_HaccpPlan4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
}
