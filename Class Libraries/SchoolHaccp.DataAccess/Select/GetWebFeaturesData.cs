using System.Data;
using System.Globalization;


namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebFeaturesData : DataAccessBase
	{
		public GetWebFeaturesData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspGetWebFeatures.ToString();
		}

		public IDataReader Get()
		{
			GetWebFeaturesDataParameters getParameters = new GetWebFeaturesDataParameters();
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetWebFeaturesDataParameters
	{
		object[] m_Parameters;

		public GetWebFeaturesDataParameters()
		{
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[2];
			parameters[0] = 1;
			parameters[1] = CultureInfo.CurrentCulture.Name;
			Parameters = parameters;
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
