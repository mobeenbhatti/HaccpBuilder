using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
 public   class ProcessSetVendor:IBusinessLogic
    {
         private Vendors m_Vendor;

        public ProcessSetVendor()
        {
        }

        public void Invoke()
        {
            SetVendors setVendor = new SetVendors();
            setVendor.Vendors = this.m_Vendor;
            setVendor.Update();
        }

        public Vendors Vendor
        {
            get { return m_Vendor; }
            set { m_Vendor = value; }
        }
    }
}
