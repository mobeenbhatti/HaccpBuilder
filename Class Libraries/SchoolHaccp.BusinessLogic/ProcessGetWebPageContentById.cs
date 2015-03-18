using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebPageContentById : IBusinessLogic
	{
		private WebPageContent m_WebPageContent;
		private IDataReader m_ResultSet;

		public ProcessGetWebPageContentById()
		{
		}

		public void Invoke()
		{
			GetWebPageContentByIdData getNews = new GetWebPageContentByIdData();
			getNews.WebPageContent = this.m_WebPageContent;
			IDataReader reader = getNews.Get();
			this.m_ResultSet = reader;
			if (reader.Read())
			{
				this.m_WebPageContent.WebPageContentId = int.Parse(reader["WebPageContentId"].ToString());
				this.m_WebPageContent.Name = reader["Name"].ToString();
				this.m_WebPageContent.WebPage = reader["WebPage"].ToString();
				this.m_WebPageContent.TitleContentKey = reader["TitleContentKey"].ToString();
				this.m_WebPageContent.TitleContent.ContentValue = reader["TitleContent"].ToString();
				this.m_WebPageContent.BodyContentKey = reader["BodyContentKey"].ToString();
				this.m_WebPageContent.BodyContent.ContentValue = reader["BodyContent"].ToString();
				this.m_WebPageContent.CultureId = reader["CultureId"].ToString();
				this.m_WebPageContent.Active = Convert.ToBoolean(reader["Active"]);
				this.m_WebPageContent.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
				this.m_WebPageContent.ModifiedDate = Convert.ToDateTime(reader["ModifiedDate"]);
			}
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}

