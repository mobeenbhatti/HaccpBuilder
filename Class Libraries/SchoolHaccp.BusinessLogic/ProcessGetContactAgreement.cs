using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessGetContactAgreement
    {
        private IDataReader m_ResultSet;
        private ContactAgreement m_ContactAgreements;

        public ProcessGetContactAgreement()
        {
        }

        public void Invoke()
        {
            GetContactAgreement getContactAgreements = new GetContactAgreement();
            //getContactAgreements. = this.ContactAgreements;
            //this.ResultSet = getContactAgreements.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
       
        public DataSet GetContactAgreementsById(int nContactId)
        {
            GetContactAgreement getContactAgreement = new GetContactAgreement();
            return getContactAgreement.GetContactAgreementByContactId(nContactId);
        }
        public DataSet GetContactAgreementByDate(int nContactId, string strIP)
        {
            GetContactAgreement getContactAgreement = new GetContactAgreement();
            return getContactAgreement.GetContactAgreementByDate(nContactId,strIP);
        }
        public ContactAgreement ContactAgreements
        {
            get { return m_ContactAgreements; }
            set { m_ContactAgreements = value; }
        }
    }
}
