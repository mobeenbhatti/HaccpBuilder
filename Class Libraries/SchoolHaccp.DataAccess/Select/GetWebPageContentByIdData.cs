using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebPageContentByIdData : DataAccessBase
	{
		private WebPageContent m_WebPageContent;

		public GetWebPageContentByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetWebPageContentByID.ToString();
		}

		public IDataReader Get()
		{
			GetWebPageContentByIdDataParameters getParameters = new GetWebPageContentByIdDataParameters(this.m_WebPageContent);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			return dataServices.ExecuteReader(getParameters.Parameters);
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}
	}

	public class GetWebPageContentByIdDataParameters
	{
		private WebPageContent m_WebPageContent;
		object[] m_Parameters;

		public GetWebPageContentByIdDataParameters(WebPageContent webPageContent)
		{
			this.m_WebPageContent = webPageContent;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[1];
			parameters[0] = this.m_WebPageContent.WebPageContentId;
			Parameters = parameters;
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
