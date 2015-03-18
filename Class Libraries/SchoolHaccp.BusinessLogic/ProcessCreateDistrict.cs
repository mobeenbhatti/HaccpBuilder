using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateDistrict: IBusinessLogic
    {
        private District m_District;
       private Contact m_Contact;
       private Address m_Address;

        public ProcessCreateDistrict()
        {
        }

        public void Invoke()
        {
            CreateDistrict createDistrict = new CreateDistrict();
            createDistrict.District = this.District;
            createDistrict.Conatact = this.Contact;
            createDistrict.Address = this.Address;
            createDistrict.Insert();            
        }
        public void Invoke(string strMode)
        {
            CreateDistrict createDistrict = new CreateDistrict();
            createDistrict.District = this.District;
            createDistrict.Conatact = this.Contact;
            createDistrict.Address = this.Address;
            createDistrict.Insert(strMode);
        }
        public void CopyDistrict()
        {
            CreateDistrict createDistrict = new CreateDistrict();
            createDistrict.District = this.District;
            createDistrict.Conatact = this.Contact;
            createDistrict.Address = this.Address;
            createDistrict.CopyDistrict();
        }

        public District District
        {
            get { return m_District; }
            set { m_District = value; }
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
