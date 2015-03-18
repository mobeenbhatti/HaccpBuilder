using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Insert
{
  public  class CreateContactAgreement : DataAccessBase
    {
        private ContactAgreement m_ContactAgreement;

        public CreateContactAgreement()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertContactAgreement.ToString();
        }

        public void Insert()
        {

            CreateContactAgreementDataParameters createParameters = new CreateContactAgreementDataParameters(this.m_ContactAgreement);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public ContactAgreement ContactAgreement
        {
            get { return m_ContactAgreement; }
            set { m_ContactAgreement = value; }
        }
    }

    public class CreateContactAgreementDataParameters
    {
        private ContactAgreement m_ContactAgreement;
        object[] m_Parameters;

        public CreateContactAgreementDataParameters(ContactAgreement ContactAgreement)
        {
            this.m_ContactAgreement = ContactAgreement;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[3];
            parameters[0] = this.m_ContactAgreement.ContactID ;            
            parameters[1] = this.m_ContactAgreement.IPAddress;
            parameters[2] = this.m_ContactAgreement.Agree;
          
            Parameters = parameters;
           
        }

        public ContactAgreement ContactAgreement
        {
            get { return m_ContactAgreement; }
            set { m_ContactAgreement = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
