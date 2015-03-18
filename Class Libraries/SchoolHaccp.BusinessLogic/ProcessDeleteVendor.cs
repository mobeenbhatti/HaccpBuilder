using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessDeleteVendor:IBusinessLogic
    {
        private Vendors m_Vendors;

        public ProcessDeleteVendor()
        {
        }

        public void Invoke()
        {
            DeleteVendors deleteVendors = new DeleteVendors();
            deleteVendors.Vendors = this.m_Vendors;
            deleteVendors.Delete();
        }

        public Vendors Vendors
        {
            get { return m_Vendors; }
            set { m_Vendors = value; }
        }
    }
}
