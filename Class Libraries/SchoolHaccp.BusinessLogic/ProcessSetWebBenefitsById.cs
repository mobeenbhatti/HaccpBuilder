using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetWebBenefitsById : IBusinessLogic
	{
		private WebBenefits m_WebBenefits;

		public ProcessSetWebBenefitsById()
		{
		}

		public void Invoke()
		{
			SetWebBenefitsByIdData setWebBenefits = new SetWebBenefitsByIdData();
			setWebBenefits.WebBenefits = this.m_WebBenefits;
			setWebBenefits.Update();
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}
	}
}
