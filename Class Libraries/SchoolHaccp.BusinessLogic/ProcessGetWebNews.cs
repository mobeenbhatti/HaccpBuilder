using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebNews : IBusinessLogic
	{
		private IDataReader m_ResultSet;

		public ProcessGetWebNews()
		{
		}

		public void Invoke()
		{
			GetWebNewsData getNews = new GetWebNewsData();
			this.ResultSet = getNews.Get();
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
