using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessCreateWebFeatures : IBusinessLogic
	{
		private WebFeatures m_WebFeatures;

		public ProcessCreateWebFeatures()
		{
		}

		public void Invoke()
		{
			CreateWebFeaturesData createFeatures = new CreateWebFeaturesData();
			createFeatures.WebFeatures = this.m_WebFeatures;
			createFeatures.Insert();
			this.m_WebFeatures = createFeatures.WebFeatures;
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}
	}
}


