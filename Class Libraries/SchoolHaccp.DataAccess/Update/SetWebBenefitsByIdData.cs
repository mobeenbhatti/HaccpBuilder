using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetWebBenefitsByIdData : DataAccessBase
	{
		private WebBenefits m_WebBenefits;

		public SetWebBenefitsByIdData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateWebBenefits.ToString();
		}

		public void Update()
		{
			SetWebBenefitsByIdDataParameters setParameters = new SetWebBenefitsByIdDataParameters(this.m_WebBenefits);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}
	}

	public class SetWebBenefitsByIdDataParameters
	{
		private WebBenefits m_WebBenefits;
		object[] m_Parameters;

		public SetWebBenefitsByIdDataParameters(WebBenefits webBenefits)
		{
			this.m_WebBenefits = webBenefits;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[4];
			parameters[0] = this.m_WebBenefits.WebBenefitsId;
			parameters[1] = this.m_WebBenefits.Content.ContentValue;
			parameters[2] = this.m_WebBenefits.Name;
			parameters[3] = this.m_WebBenefits.Active;
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
