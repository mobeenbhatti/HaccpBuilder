using System;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Controls_TopDistrictMenu : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		SetActiveTab();
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

