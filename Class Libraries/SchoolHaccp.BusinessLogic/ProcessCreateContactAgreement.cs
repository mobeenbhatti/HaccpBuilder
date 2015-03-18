using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateContactAgreement
    {
        private ContactAgreement m_ContactAgreement;

        public ProcessCreateContactAgreement()
        {
        }

        public void Invoke()
        {
            CreateContactAgreement createContactAgreement = new CreateContactAgreement();
            createContactAgreement.ContactAgreement = this.m_ContactAgreement;
            createContactAgreement.Insert();
            this.m_ContactAgreement = createContactAgreement.ContactAgreement;
        }       

        public ContactAgreement ContactAgreement
        {
            get { return m_ContactAgreement; }
            set { m_ContactAgreement = value; }
        }
    }
}
