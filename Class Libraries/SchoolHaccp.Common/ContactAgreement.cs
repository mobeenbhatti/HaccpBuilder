using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class ContactAgreement
    {
        private int m_ContactAgreementID;
        private int m_ContactID;
        private string m_IPAddress;     
        private int m_Agree;               
        private DateTime m_EntryDate;
        private DateTime m_ModifiedDate;

        public int ContactAgreementID
        {
            get { return m_ContactAgreementID; }
            set { m_ContactAgreementID = value; }
        }
        public string IPAddress
        {
            get { return m_IPAddress; }
            set { m_IPAddress = value; }
        }
        public int ContactID
        {
            get { return m_ContactID; }
            set { m_ContactID = value; }
        }

        public int Agree
        {
            get { return m_Agree; }
            set { m_Agree = value; }
        }
       
        public DateTime EntryDate
        {
            get { return m_EntryDate; }
            set { m_EntryDate = value; }
        }
        public DateTime ModifiedDate
        {
            get { return m_ModifiedDate; }
            set { m_ModifiedDate = value; }
        }
    }
}
