using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebFeaturesById : IBusinessLogic
	{
		private WebFeatures m_WebFeatures;
		private IDataReader m_ResultSet;

		public ProcessGetWebFeaturesById()
		{
		}

		public void Invoke()
		{
			GetWebFeaturesByIdData getNews = new GetWebFeaturesByIdData();
			getNews.WebFeatures = this.m_WebFeatures;
			IDataReader reader = getNews.Get();
			this.m_ResultSet = reader;
			if (reader.Read())
			{
				this.m_WebFeatures.WebFeaturesId = int.Parse(reader["WebFeaturesId"].ToString());
				this.m_WebFeatures.Name = reader["Name"].ToString();
				this.m_WebFeatures.ContentKey = reader["ContentKey"].ToString();
				this.m_WebFeatures.Content.ContentValue = reader["ContentValue"].ToString();
				this.m_WebFeatures.CultureId = reader["CultureId"].ToString();
				this.m_WebFeatures.Active = Convert.ToBoolean(reader["Active"]);
				this.m_WebFeatures.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
				this.m_WebFeatures.ModifiedDate = Convert.ToDateTime(reader["ModifiedDate"]);
			}
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
