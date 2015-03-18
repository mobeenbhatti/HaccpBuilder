using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessCreateWebNews : IBusinessLogic
	{
		private WebNews m_WebNews;

		public ProcessCreateWebNews()
		{
		}

		public void Invoke()
		{
			CreateWebNewsData createNews = new CreateWebNewsData();
			createNews.WebNews = this.m_WebNews;
			createNews.Insert();
			this.m_WebNews = createNews.WebNews;
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}
	}
}
