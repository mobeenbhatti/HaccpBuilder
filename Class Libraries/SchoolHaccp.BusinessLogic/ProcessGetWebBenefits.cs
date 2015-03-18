using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessGetWebBenefits : IBusinessLogic
	{
		private IDataReader m_ResultSet;

		public ProcessGetWebBenefits()
		{
		}

		public void Invoke()
		{
			GetWebBenefitsData getBenefits = new GetWebBenefitsData();
			this.ResultSet = getBenefits.Get();
		}

		public IDataReader ResultSet
		{
			get { return m_ResultSet; }
			set { m_ResultSet = value; }
		}
	}
}
