using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetKitchen: IBusinessLogic
    {
        private Kitchen m_Kitchen;
       private Contact m_Contact;
       private Address m_Address;

        public ProcessSetKitchen()
        {

        }

        public void Invoke()
        {
            SetKitchen setKitchen = new SetKitchen();
            setKitchen.Kitchen = this.Kitchen;
            setKitchen.Conatact = this.Contact;
            setKitchen.Address = this.Address;
            setKitchen.Update();            
        }
        public void UpdateKitchenContact()
        {
            SetKitchen setKitchen = new SetKitchen();
            setKitchen.Kitchen = this.Kitchen;
            setKitchen.Conatact = this.Contact;
            setKitchen.Address = this.Address;
            setKitchen.UpdateKitchenContact();
        }

        public void UpdateKitchenTimeZone(int nKitcheId, string strTieZone)
        {
            SetKitchen setKitchen = new SetKitchen();
            setKitchen.UpdateKitchenTimeZone(nKitcheId, strTieZone);
        }
        public void UpdateKitchenLogo(int nKitcheId, string strFileName)
        {
            SetKitchen setKitchen = new SetKitchen();
            setKitchen.UpdateKitchenLogo(nKitcheId, strFileName);
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
