using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebPageContent : IBusinessLogic
	{
		private string m_WebPage;
		private IDataReader m_ResultSet;

		public ProcessGetWebPageContent()
		{
		}

		public void Invoke()
		{
			GetWebPageContentData getPageContent = new GetWebPageContentData();
			getPageContent.WebPage = this.m_WebPage;
			this.ResultSet = getPageContent.Get();
		}

		public string WebPage
		{
			get { return m_WebPage; }
			set { m_WebPage = value; }
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
