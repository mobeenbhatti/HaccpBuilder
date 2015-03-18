using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessCreateWebPageContent : IBusinessLogic
	{
		private WebPageContent m_WebPageContent;

		public ProcessCreateWebPageContent()
		{
		}

		public void Invoke()
		{
			CreateWebPageContentData createNews = new CreateWebPageContentData();
			createNews.WebPageContent = this.m_WebPageContent;
			createNews.Insert();
			this.m_WebPageContent = createNews.WebPageContent;
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}
	}
}
