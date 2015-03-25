using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateKitchen: IBusinessLogic
    {
        private Kitchen m_Kitchen;
       private Contact m_Contact;
       private Address m_Address;

        public ProcessCreateKitchen()
        {
        }

        public void Invoke()
        {
            CreateKitchen createKitchen = new CreateKitchen();
            createKitchen.Kitchen = this.Kitchen;
            createKitchen.Conatact = this.Contact;
            createKitchen.Address = this.Address;
            createKitchen.Insert();            
        }

        public int Create()
        {
            CreateKitchen createKitchen = new CreateKitchen();
            createKitchen.Kitchen = this.Kitchen;
            createKitchen.Conatact = this.Contact;
            createKitchen.Address = this.Address;
            return createKitchen.Create();
        }
        public void Invoke(string strMode)
        {
            CreateKitchen createKitchen = new CreateKitchen();
            createKitchen.Kitchen = this.Kitchen;
            createKitchen.Conatact = this.Contact;
            createKitchen.Address = this.Address;
            createKitchen.Insert("php");
        }
        public void CopyKitchen()
        {
            CreateKitchen createKitchen = new CreateKitchen();
            createKitchen.Kitchen = this.Kitchen;
            createKitchen.Conatact = this.Contact;
            createKitchen.Address = this.Address;
            createKitchen.CopyKitchen();
        }
        public void CreateKitchenEmployee()
        {
            CreateKitchen createKitchen = new CreateKitchen();
            createKitchen.Kitchen = this.Kitchen;
            createKitchen.Conatact = this.Contact;
            createKitchen.Address = this.Address;
            createKitchen.CreateKitchenContact();
        }


        public Kitchen Kitchen
        {
            get { return m_Kitchen; }
            set { m_Kitchen = value; }
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
