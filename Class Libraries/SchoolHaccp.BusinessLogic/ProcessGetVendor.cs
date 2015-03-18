using System;
using System.Collections.Generic;
using System.Text;
using System.Data;


using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
  public  class ProcessGetVendor:IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private Vendors m_Vendor;
        private int m_TotalRecords;

        public ProcessGetVendor()
        {
        }

        public void Invoke()
        {
            GetVendors getVendor = new GetVendors();
            getVendor.Vendors = this.Vendor;
            this.ResultSet = getVendor.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetVendorByKitchenId(int nKitchenId)
        {
            GetVendors getLog = new GetVendors();
            return getLog.GetVendorsDataSet(nKitchenId);
        }
        public DataSet GetVendorByKitchenIdPaging(int nKitchenId, int nCurrentPage, int nPageSize)
        {
            GetVendors getLog = new GetVendors();
            DataSet ds =  getLog.GetVendorsPagedDataSet(nKitchenId,nCurrentPage,nPageSize);
            m_TotalRecords = getLog.TotalRecords;
            return ds;
        }
        public IDataReader GetVendorByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetVendors getLog = new GetVendors();
            return getLog.GetVendorsByDate(dtEntryDate, nKitchenId);
        }
        public IDataReader GetVendorLimit(int nKitchenId)
        {
            GetVendors getLog = new GetVendors();
            return getLog.GetVendorsLimit(nKitchenId);
        }
        public DataSet GetVendorsByName(string strName, int nKitchenId)
        {
            GetVendors getLog = new GetVendors();
            return getLog.GetVendorsByName(strName,nKitchenId);
        }

       
        public Vendors Vendor
        {
            get { return m_Vendor; }
            set { m_Vendor = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }

        }
    }
}
