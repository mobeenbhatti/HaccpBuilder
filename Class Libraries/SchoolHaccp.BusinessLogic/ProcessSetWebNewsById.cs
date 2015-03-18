using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetWebNewsById : IBusinessLogic
	{
		private WebNews m_WebNews;

		public ProcessSetWebNewsById()
		{
		}

		public void Invoke()
		{
			SetWebNewsByIdData setWebNews = new SetWebNewsByIdData();
			setWebNews.WebNews = this.m_WebNews;
			setWebNews.Update();
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}
	}
}
