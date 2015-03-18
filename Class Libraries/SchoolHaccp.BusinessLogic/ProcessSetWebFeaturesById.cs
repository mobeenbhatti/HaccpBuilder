using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetWebFeaturesById : IBusinessLogic
	{
		private WebFeatures m_WebFeatures;

		public ProcessSetWebFeaturesById()
		{
		}

		public void Invoke()
		{
			SetWebFeaturesByIdData setWebFeatures = new SetWebFeaturesByIdData();
			setWebFeatures.WebFeatures = this.m_WebFeatures;
			setWebFeatures.Update();
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}
	}
}
