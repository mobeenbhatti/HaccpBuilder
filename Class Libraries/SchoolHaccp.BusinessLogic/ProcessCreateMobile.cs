using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateMobile : IBusinessLogic
    {
        private Mobile m_Mobile;
        private Contact m_Contact;
        private Address m_Address;

        public ProcessCreateMobile()
        {
        }

        public void Invoke()
        {
            CreateMobile createMobile = new CreateMobile();
            createMobile.Mobile = this.Mobile;
            createMobile.Conatact = this.Contact;
            createMobile.Address = this.Address;
            createMobile.Insert();
        }
        public void CreateMobileChecklist(int MobileId, int ChecklistId,int AlertStatus)
        {
            CreateMobile createMobile = new CreateMobile();
            createMobile.CreateMobileChecklist(MobileId, ChecklistId,AlertStatus);

        }
        public void Invoke(string strMode)
        {
            CreateMobile createMobile = new CreateMobile();
            createMobile.Mobile = this.Mobile;
            createMobile.Conatact = this.Contact;
            createMobile.Address = this.Address;
            createMobile.Insert("php");
        }
        public void CopyMobile()
        {
            CreateMobile createMobile = new CreateMobile();
            createMobile.Mobile = this.Mobile;
            createMobile.Conatact = this.Contact;
            createMobile.Address = this.Address;
            createMobile.CopyMobile();
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
