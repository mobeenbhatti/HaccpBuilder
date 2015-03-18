using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetDistrict: IBusinessLogic
    {
        private District m_District;
       private Contact m_Contact;
       private Address m_Address;

        public ProcessSetDistrict()
        {

        }

        public void Invoke()
        {
            SetDistrict setDistrict = new SetDistrict();
            setDistrict.District = this.District;
            setDistrict.Conatact = this.Contact;
            setDistrict.Address = this.Address;
            setDistrict.Update();            
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
