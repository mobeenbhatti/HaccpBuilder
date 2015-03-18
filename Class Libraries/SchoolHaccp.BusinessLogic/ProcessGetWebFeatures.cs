using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebFeatures : IBusinessLogic
	{
		private IDataReader m_ResultSet;

		public ProcessGetWebFeatures()
		{
		}

		public void Invoke()
		{
			GetWebFeaturesData getFeatures = new GetWebFeaturesData();
			this.ResultSet = getFeatures.Get();
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
