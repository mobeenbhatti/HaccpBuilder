using System.Data;
using System.Globalization;


namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebNewsData : DataAccessBase
	{
		public GetWebNewsData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspGetWebNews.ToString();
		}

		public IDataReader Get()
		{
			GetWebNewsDataParameters getParameters = new GetWebNewsDataParameters();
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetWebNewsDataParameters
	{
		object[] m_Parameters;

		public GetWebNewsDataParameters()
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
