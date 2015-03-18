using System;
using System.Collections.Generic;
using System.Text;
using System.Data;


using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetCustomer : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private Customers m_Customer;

        public ProcessGetCustomer()
        {
        }

        public void Invoke()
        {
            GetCustomers getCustomer = new GetCustomers();
            getCustomer.Customers = this.Customer;
            this.ResultSet = getCustomer.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCustomerByKitchenId(int nKitchenId)
        {
            GetCustomers getLog = new GetCustomers();
            return getLog.GetCustomersDataSet(nKitchenId);
        }
        public IDataReader GetCustomerByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetCustomers getLog = new GetCustomers();
            return getLog.GetCustomersByDate(dtEntryDate, nKitchenId);
        }
        public IDataReader GetCustomerLimit(int nKitchenId)
        {
            GetCustomers getLog = new GetCustomers();
            return getLog.GetCustomersLimit(nKitchenId);
        }
        public DataSet GetCustomersByName(string strName, int nKitchenId)
        {
            GetCustomers getLog = new GetCustomers();
            return getLog.GetCustomersByName(strName, nKitchenId);
        }


        public Customers Customer
        {
            get { return m_Customer; }
            set { m_Customer = value; }
        }
    }
}

