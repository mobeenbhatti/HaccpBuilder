using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateWebNewsData : DataAccessBase
	{
		private WebNews m_WebNews;

		public CreateWebNewsData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertWebNews.ToString();
		}

		public void Insert()
		{
			int webNewsId = 0;
			CreateWebNewsDataParameters createParameters = new CreateWebNewsDataParameters(this.m_WebNews);
			using (DataServices dataServices = new DataServices(base.StoredProcedureName))
			{
				try
				{
					object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
					if (!int.TryParse(returnValue.ToString(), out webNewsId))
					{
						throw new Exception("Failed to retrieve ID value.");
					}
				}
				catch (Exception ex)
				{
					throw ex;
				}
				this.m_WebNews.WebNewsId = webNewsId;
			}
		}

		public WebNews WebNews
		{
			get { return m_WebNews; }
			set { m_WebNews = value; }
		}
	}

	public class CreateWebNewsDataParameters
	{
		private WebNews m_WebNews;
		object[] m_Parameters;

		public CreateWebNewsDataParameters(WebNews webNews)
		{
			this.m_WebNews = webNews;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[5];
			parameters[0] = this.m_WebNews.CultureId;
			parameters[1] = this.m_WebNews.TitleContent.ContentValue;
			parameters[2] = this.m_WebNews.BodyContent.ContentValue;
			parameters[3] = this.m_WebNews.Name;
			parameters[4] = this.m_WebNews.Active;
			this.m_Parameters = parameters;
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
