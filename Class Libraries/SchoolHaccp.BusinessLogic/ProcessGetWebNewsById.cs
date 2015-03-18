using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebNewsById : IBusinessLogic
	{
		private WebNews m_WebNews;
		private IDataReader m_ResultSet;

		public ProcessGetWebNewsById()
		{
		}

		public void Invoke()
		{
			GetWebNewsByIdData getNews = new GetWebNewsByIdData();
			getNews.WebNews = this.m_WebNews;
			IDataReader reader = getNews.Get();
			this.m_ResultSet = reader;
			if (reader.Read())
			{
				this.m_WebNews.WebNewsId = int.Parse(reader["WebNewsId"].ToString());
				this.m_WebNews.Name = reader["Name"].ToString();
				this.m_WebNews.TitleContentKey = reader["TitleContentKey"].ToString();
				this.m_WebNews.TitleContent.ContentValue = reader["TitleContent"].ToString();
				this.m_WebNews.BodyContentKey = reader["BodyContentKey"].ToString();
				this.m_WebNews.BodyContent.ContentValue = reader["BodyContent"].ToString();
				this.m_WebNews.CultureId = reader["CultureId"].ToString();
				this.m_WebNews.Active = Convert.ToBoolean(reader["Active"]);
				this.m_WebNews.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
				this.m_WebNews.ModifiedDate = Convert.ToDateTime(reader["ModifiedDate"]);
			}
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
