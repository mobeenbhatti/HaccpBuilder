using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public class BasePage : Page
{
	public BasePage()
	{
	}

	protected override void OnInit(EventArgs e)
	{
		if (!String.IsNullOrEmpty(MetaKeywords))
		{
			HtmlMeta metaTag = new HtmlMeta();
			metaTag.Name = "Content";
			metaTag.Content = MetaKeywords;
			Header.Controls.Add(metaTag);
		}
		base.OnInit(e);
	}

	private string m_MetaKeywords;
	public string MetaKeywords
	{
		get { return m_MetaKeywords; }
		set { m_MetaKeywords = value; }
	}
}
