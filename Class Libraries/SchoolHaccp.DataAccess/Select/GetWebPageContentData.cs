using System.Data;
using System.Globalization;


namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebPageContentData : DataAccessBase
	{
		string m_WebPage;

		public GetWebPageContentData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspGetWebPageContent.ToString();
		}

		public IDataReader Get()
		{
			GetWebPageContentDataParameters getParameters = new GetWebPageContentDataParameters(this.m_WebPage);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			return dataServices.ExecuteReader(getParameters.Parameters);
		}

		public string WebPage
		{
			get { return m_WebPage; }
			set { m_WebPage = value; }
		}
	}

	public class GetWebPageContentDataParameters
	{
		object[] m_Parameters;
		string m_WebPage;

		public GetWebPageContentDataParameters(string p_WebPage)
		{
			this.m_WebPage = p_WebPage;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[3];
			parameters[0] = true;
			parameters[1] = CultureInfo.CurrentCulture.Name;
			parameters[2] = this.WebPage;
			Parameters = parameters;
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}

		public string WebPage
		{
			get { return m_WebPage; }
			set { m_WebPage = value; }
		}
	}
}
