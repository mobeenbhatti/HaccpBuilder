using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateVendor:IBusinessLogic
    {
        private Vendors m_Vendor;

        public ProcessCreateVendor()
        {
        }

        public void Invoke()
        {
            CreateVendors createVendor = new CreateVendors();
            createVendor.Vendors = this.m_Vendor;
            createVendor.Insert();
            this.m_Vendor = createVendor.Vendors;
        }
        public void Invoke(string strMode)
        {
            CreateVendors createVendor = new CreateVendors();
            createVendor.Vendors = this.m_Vendor;
            createVendor.Insert("php");
           
        }
        public IDataReader Upload(string strFileName, int nKitchenId)
        {
            CreateVendors createVendor = new CreateVendors();
           return createVendor.Upload(strFileName, nKitchenId);

        }


        public Vendors Vendor
        {
            get { return m_Vendor; }
            set { m_Vendor = value; }
        }
    }
}
