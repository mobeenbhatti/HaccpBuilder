using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebFeaturesByIdData : DataAccessBase
	{
		private WebFeatures m_WebFeatures;

		public GetWebFeaturesByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetWebFeaturesByID.ToString();
		}

		public IDataReader Get()
		{
			GetWebFeaturesByIdDataParameters getParameters = new GetWebFeaturesByIdDataParameters(this.m_WebFeatures);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			return dataServices.ExecuteReader(getParameters.Parameters);
		}

		public WebFeatures WebFeatures
		{
			get { return m_WebFeatures; }
			set { m_WebFeatures = value; }
		}
	}

	public class GetWebFeaturesByIdDataParameters
	{
		private WebFeatures m_WebFeatures;
		object[] m_Parameters;

		public GetWebFeaturesByIdDataParameters(WebFeatures webFeatures)
		{
			this.m_WebFeatures = webFeatures;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[1];
			parameters[0] = this.m_WebFeatures.WebFeaturesId;
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
