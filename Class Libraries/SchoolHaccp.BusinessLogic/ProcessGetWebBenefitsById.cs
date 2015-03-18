using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebBenefitsById : IBusinessLogic
	{
		private WebBenefits m_WebBenefits;
		private IDataReader m_ResultSet;

		public ProcessGetWebBenefitsById()
		{
		}

		public void Invoke()
		{
			GetWebBenefitsByIdData getNews = new GetWebBenefitsByIdData();
			getNews.WebBenefits = this.m_WebBenefits;
			IDataReader reader = getNews.Get();
			this.m_ResultSet = reader;
			if (reader.Read())
			{
				this.m_WebBenefits.WebBenefitsId = int.Parse(reader["WebBenefitsId"].ToString());
				this.m_WebBenefits.Name = reader["Name"].ToString();
				this.m_WebBenefits.ContentKey = reader["ContentKey"].ToString();
				this.m_WebBenefits.Content.ContentValue = reader["ContentValue"].ToString();
				this.m_WebBenefits.CultureId = reader["CultureId"].ToString();
				this.m_WebBenefits.Active = Convert.ToBoolean(reader["Active"]);
				this.m_WebBenefits.CreatedDate = Convert.ToDateTime(reader["CreatedDate"]);
				this.m_WebBenefits.ModifiedDate = Convert.ToDateTime(reader["ModifiedDate"]);
			}
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
