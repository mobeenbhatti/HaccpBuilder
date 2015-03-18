using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateWebBenefitsData : DataAccessBase
	{
		private WebBenefits m_WebBenefits;

		public CreateWebBenefitsData()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertWebBenefits.ToString();
		}

		public void Insert()
		{
			int webBenefitsId = 0;
			CreateWebBenefitsDataParameters createParameters = new CreateWebBenefitsDataParameters(this.m_WebBenefits);
			using (DataServices dataServices = new DataServices(base.StoredProcedureName))
			{
				try
				{
					object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
					if (!int.TryParse(returnValue.ToString(), out webBenefitsId))
					{
						throw new Exception("Failed to retrieve ID value.");
					}
				}
				catch (Exception ex)
				{
					throw ex;
				}
				this.m_WebBenefits.WebBenefitsId = webBenefitsId;
			}
		}

		public WebBenefits WebBenefits
		{
			get { return m_WebBenefits; }
			set { m_WebBenefits = value; }
		}
	}

	public class CreateWebBenefitsDataParameters
	{
		private WebBenefits m_WebBenefits;
		object[] m_Parameters;

		public CreateWebBenefitsDataParameters(WebBenefits webBenefits)
		{
			this.m_WebBenefits = webBenefits;
			Build();
		}

		private void Build()
		{
			object[] parameters = new object[4];
			parameters[0] = this.m_WebBenefits.CultureId;
			parameters[1] = this.m_WebBenefits.Content.ContentValue;
			parameters[2] = this.m_WebBenefits.Name;
			parameters[3] = this.m_WebBenefits.Active;
			this.m_Parameters = parameters;
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

