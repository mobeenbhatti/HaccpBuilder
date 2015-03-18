using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateWebFeaturesData : DataAccessBase
	{
		private WebFeatures m_WebFeatures;

		public CreateWebFeaturesData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertWebFeatures.ToString();
		}

		public void Insert()
		{
			int webFeaturesId = 0;
			CreateWebFeaturesDataParameters createParameters = new CreateWebFeaturesDataParameters(this.m_WebFeatures);
			using (DataServices dataServices = new DataServices(base.StoredProcedureName))
			{
				try
				{
					object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
					if (!int.TryParse(returnValue.ToString(), out webFeaturesId))
					{
						throw new Exception("Failed to retrieve ID value.");
					}
				}
				catch (Exception ex)
				{
					throw ex;
				}
				this.m_WebFeatures.WebFeaturesId = webFeaturesId;
			}
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}
	}

	public class CreateWebFeaturesDataParameters
	{
		private WebFeatures m_WebFeatures;
		object[] m_Parameters;

		public CreateWebFeaturesDataParameters(WebFeatures webFeatures)
		{
			this.m_WebFeatures = webFeatures;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[4];
			parameters[0] = this.m_WebFeatures.CultureId;
			parameters[1] = this.m_WebFeatures.Content.ContentValue;
			parameters[2] = this.m_WebFeatures.Name;
			parameters[3] = this.m_WebFeatures.Active;
			this.m_Parameters = parameters;
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
