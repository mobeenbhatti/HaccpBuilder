using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetWebPageContentById : IBusinessLogic
	{
		private WebPageContent m_WebPageContent;

		public ProcessSetWebPageContentById()
		{
		}

		public void Invoke()
		{
			SetWebPageContentByIdData setWebPageContent = new SetWebPageContentByIdData();
			setWebPageContent.WebPageContent = this.m_WebPageContent;
			setWebPageContent.Update();
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}
	}
}

