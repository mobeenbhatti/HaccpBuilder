using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebNewsByIdData : DataAccessBase
	{
		private WebNews m_WebNews;

		public GetWebNewsByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetWebNewsByID.ToString();
		}

		public IDataReader Get()
		{
			GetWebNewsByIdDataParameters getParameters = new GetWebNewsByIdDataParameters(this.m_WebNews);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			return dataServices.ExecuteReader(getParameters.Parameters);
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}
	}

	public class GetWebNewsByIdDataParameters
	{
		private WebNews m_WebNews;
		object[] m_Parameters;

		public GetWebNewsByIdDataParameters(WebNews webNews)
		{
			this.m_WebNews = webNews;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[1];
			parameters[0] = this.m_WebNews.WebNewsId;
			Parameters = parameters;
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
