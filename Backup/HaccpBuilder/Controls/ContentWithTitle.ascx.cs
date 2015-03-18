using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using SchoolHaccp.BusinessLogic;

public partial class Controls_ContentWithTitle : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			LoadPageContent();
		}
	}

	private void LoadPageContent()
	{
		ProcessGetWebPageContent getPageContent = new ProcessGetWebPageContent();
		string currentPage = Path.GetFileName(Request.Url.AbsolutePath);
		getPageContent.WebPage = currentPage;
		getPageContent.Invoke();
		this.DataList1.DataSource = getPageContent.ResultSet;
		this.DataList1.DataBind();
	}
}
