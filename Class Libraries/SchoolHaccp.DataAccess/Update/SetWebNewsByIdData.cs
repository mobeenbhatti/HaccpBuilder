using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetWebNewsByIdData : DataAccessBase
	{
		private WebNews m_WebNews;

		public SetWebNewsByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateWebNews.ToString();
		}

		public void Update()
		{
			SetWebNewsByIdDataParameters setParameters = new SetWebNewsByIdDataParameters(this.m_WebNews);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}
	}

	public class SetWebNewsByIdDataParameters
	{
		private WebNews m_WebNews;
		object[] m_Parameters;

		public SetWebNewsByIdDataParameters(WebNews webNews)
		{
			this.m_WebNews = webNews;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[5];
			parameters[0] = this.m_WebNews.WebNewsId;
			parameters[1] = this.m_WebNews.TitleContent.ContentValue;
			parameters[2] = this.m_WebNews.BodyContent.ContentValue;
			parameters[3] = this.m_WebNews.Name;
			parameters[4] = this.m_WebNews.Active;
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
