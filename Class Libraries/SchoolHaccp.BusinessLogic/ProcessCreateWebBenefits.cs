using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessCreateWebBenefits : IBusinessLogic
	{
		private WebBenefits m_WebBenefits;

		public ProcessCreateWebBenefits()
		{
		}

		public void Invoke()
		{
			CreateWebBenefitsData createBenefits = new CreateWebBenefitsData();
			createBenefits.WebBenefits = this.m_WebBenefits;
			createBenefits.Insert();
			this.m_WebBenefits = createBenefits.WebBenefits;
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}
	}
}

