using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetWebPageContentByIdData : DataAccessBase
	{
		private WebPageContent m_WebPageContent;

		public SetWebPageContentByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateWebPageContent.ToString();
		}

		public void Update()
		{
			SetWebPageContentByIdDataParameters setParameters = new SetWebPageContentByIdDataParameters(this.m_WebPageContent);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public WebPageContent WebPageContent
		{
			get { return m_WebPageContent; }
			set { m_WebPageContent = value; }
		}
	}

	public class SetWebPageContentByIdDataParameters
	{
		private WebPageContent m_WebPageContent;
		object[] m_Parameters;

		public SetWebPageContentByIdDataParameters(WebPageContent webPageContent)
		{
			this.m_WebPageContent = webPageContent;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[6];
			parameters[0] = this.m_WebPageContent.WebPageContentId;
			parameters[1] = this.m_WebPageContent.TitleContent.ContentValue;
			parameters[2] = this.m_WebPageContent.BodyContent.ContentValue;
			parameters[3] = this.m_WebPageContent.Name;
			parameters[4] = this.m_WebPageContent.WebPage;
			parameters[5] = this.m_WebPageContent.Active;
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
