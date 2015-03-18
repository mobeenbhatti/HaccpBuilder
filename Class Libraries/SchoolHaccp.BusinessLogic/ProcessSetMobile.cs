using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetMobile : IBusinessLogic
    {
        private Mobile m_Mobile;
        private Contact m_Contact;
        private Address m_Address;

        public ProcessSetMobile()
        {

        }

        public void Invoke()
        {
            SetMobile setMobile = new SetMobile();
            setMobile.Mobile = this.Mobile;
            setMobile.Conatact = this.Contact;
            setMobile.Address = this.Address;
            setMobile.Update();
        }       
        public Mobile Mobile
        {
            get { return m_Mobile; }
            set { m_Mobile = value; }
        }
        public Contact Contact
        {
            get
            {
                return this.m_Contact;
            }
            set
            {
                this.m_Contact = value;
            }
        }
        public Address Address
        {
            get
            {
                return this.m_Address;
            }
            set
            {
                this.m_Address = value;
            }
        }

    }

}
