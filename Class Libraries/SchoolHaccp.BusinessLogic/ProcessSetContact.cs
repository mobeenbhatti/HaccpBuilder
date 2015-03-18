using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetContact : IBusinessLogic
    {
        private Contact m_Contact;

        public ProcessSetContact()
        {
        }

        public void Invoke()
        {
            SetContact setContact = new SetContact();
            setContact.Contact = this.m_Contact;
            setContact.Update();
        }
        public Contact Contact
        {
            get { return m_Contact; }
            set { m_Contact = value; }
        }
        public void UpdateContactLoginStatus(int nContactId, DateTime dtLoginDate, int nIsAgree)
        {
            object[] parameters = new object[3];
            parameters[0] = nContactId;
            parameters[1] = dtLoginDate;
            parameters[2] = nIsAgree;
            SetContact setContact = new SetContact();
            setContact.UpdateContactLoginStatus(nContactId, dtLoginDate, nIsAgree);

        }
    }
}
