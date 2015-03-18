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
using SchoolHaccp.Operational;

public partial class LearnMore : System.Web.UI.Page
{
	protected override void OnInit(EventArgs e)
	{
		Utilities.SetMetaHeader("KEYWORDS", 1, "LearnMoreKeywords", Header);
		base.OnInit(e);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
	}
}
