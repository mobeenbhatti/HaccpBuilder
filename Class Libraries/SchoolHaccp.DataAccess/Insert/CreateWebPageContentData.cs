using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateWebPageContentData : DataAccessBase
	{
		private WebPageContent m_WebPageContent;

		public CreateWebPageContentData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertWebPageContent.ToString();
		}

		public void Insert()
		{
			int webPageContentId = 0;
			CreateWebPageContentDataParameters createParameters = new CreateWebPageContentDataParameters(this.m_WebPageContent);
			using (DataServices dataServices = new DataServices(base.StoredProcedureName))
			{
				try
				{
					object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
					if (returnValue != null && !int.TryParse(returnValue.ToString(), out webPageContentId))
					{
						throw new Exception("Failed to retrieve ID value.");
					}
				}
				catch (Exception ex)
				{
					throw ex;
				}
				this.m_WebPageContent.WebPageContentId = webPageContentId;
			}
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}
	}

	public class CreateWebPageContentDataParameters
	{
		private WebPageContent m_WebPageContent;
		object[] m_Parameters;

		public CreateWebPageContentDataParameters(WebPageContent webPageContent)
		{
			this.m_WebPageContent = webPageContent;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[6];
			parameters[0] = this.m_WebPageContent.CultureId;
			parameters[1] = this.m_WebPageContent.TitleContent.ContentValue;
			parameters[2] = this.m_WebPageContent.BodyContent.ContentValue;
			parameters[3] = this.m_WebPageContent.Name;
			parameters[4] = this.m_WebPageContent.WebPage;
			parameters[5] = this.m_WebPageContent.Active;
			this.m_Parameters = parameters;
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
