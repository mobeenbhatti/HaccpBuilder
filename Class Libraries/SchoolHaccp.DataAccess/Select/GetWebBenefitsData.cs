using System.Data;
using System.Globalization;


namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebBenefitsData : DataAccessBase
	{
		public GetWebBenefitsData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspGetWebBenefits.ToString();
		}

		public IDataReader Get()
		{
			GetWebBenefitsDataParameters getParameters = new GetWebBenefitsDataParameters();
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetWebBenefitsDataParameters
	{
		object[] m_Parameters;

		public GetWebBenefitsDataParameters()
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
