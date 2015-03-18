using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetWebBenefitsByIdData : DataAccessBase
	{
		private WebBenefits m_WebBenefits;

		public GetWebBenefitsByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetWebBenefitsByID.ToString();
		}

		public IDataReader Get()
		{
			GetWebBenefitsByIdDataParameters getParameters = new GetWebBenefitsByIdDataParameters(this.m_WebBenefits);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			return dataServices.ExecuteReader(getParameters.Parameters);
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}
	}

	public class GetWebBenefitsByIdDataParameters
	{
		private WebBenefits m_WebBenefits;
		object[] m_Parameters;

		public GetWebBenefitsByIdDataParameters(WebBenefits webBenefits)
		{
			this.m_WebBenefits = webBenefits;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[1];
			parameters[0] = this.m_WebBenefits.WebBenefitsId;
			Parameters = parameters;
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
