using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetWebFeaturesByIdData : DataAccessBase
	{
		private WebFeatures m_WebFeatures;

		public SetWebFeaturesByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateWebFeatures.ToString();
		}

		public void Update()
		{
			SetWebFeaturesByIdDataParameters setParameters = new SetWebFeaturesByIdDataParameters(this.m_WebFeatures);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}
	}

	public class SetWebFeaturesByIdDataParameters
	{
		private WebFeatures m_WebFeatures;
		object[] m_Parameters;

		public SetWebFeaturesByIdDataParameters(WebFeatures webFeatures)
		{
			this.m_WebFeatures = webFeatures;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[4];
			parameters[0] = this.m_WebFeatures.WebFeaturesId;
			parameters[1] = this.m_WebFeatures.Content.ContentValue;
			parameters[2] = this.m_WebFeatures.Name;
			parameters[3] = this.m_WebFeatures.Active;
			Parameters = parameters;
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
