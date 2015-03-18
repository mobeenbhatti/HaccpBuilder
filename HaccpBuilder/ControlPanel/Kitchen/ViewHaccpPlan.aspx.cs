using System;
using System.Collections;
using System.Configuration;
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
using SchoolHaccp.Common;


public partial class ControlPanel_ViewHaccpPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = DateTime.Now.ToShortDateString();
        //if (!this.IsPostBack)
        //{
        //    if (Session["KitchenId"] != null)
        //    {
        //        GetData();
        //    }
        //}       
    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item)
        {
            DetailsView dtvSOP;
            HiddenField hfSOPId;
            ProcessGetSOP getSOP = new ProcessGetSOP();
            dtvSOP = (DetailsView)e.Item.FindControl("dtvSOP");
            hfSOPId = (HiddenField)e.Item.FindControl("hfSOPId");
            dtvSOP.DataSource = getSOP.GetSOPById(int.Parse(hfSOPId.Value));
            dtvSOP.DataBind();

        }
    }
    
}
