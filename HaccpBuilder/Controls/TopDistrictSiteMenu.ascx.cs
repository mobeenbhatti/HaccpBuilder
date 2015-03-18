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

public partial class Controls_TopDistrictSiteMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
   { 
        SetActiveTab();
        if (Session["TypeId"] != null)
        {
            if ((int)Session["TypeId"] == 3)
            {
                this.menuTopMenu.Items[3].NavigateUrl = "~/ControlPanel/District/ErrorPage.aspx";
                this.menuTopMenu.Items[4].NavigateUrl = "~/ControlPanel/District/ErrorPage.aspx";
                this.menuTopMenu.Items[5].NavigateUrl = "~/ControlPanel/District/ErrorPage.aspx";
            }
            if ((int)Session["TypeId"] == 2)
            {
                this.menuTopMenu.Items[3].NavigateUrl = "~/ControlPanel/District/ErrorPage.aspx";
                this.menuTopMenu.Items[4].NavigateUrl = "~/ControlPanel/District/ErrorPage.aspx";               
            }
        }
    }
    private void SetActiveTab()
    {
        foreach (MenuItem mi in this.menuTopMenu.Items)
        {
            if (mi.NavigateUrl == this.Page.AppRelativeVirtualPath)
            {
                mi.Selected = true;
                break;
            }
        }
    }
}
