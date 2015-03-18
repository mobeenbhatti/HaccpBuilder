using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteCustomer : IBusinessLogic
    {
        private Customers m_Customers;

        public ProcessDeleteCustomer()
        {
        }

        public void Invoke()
        {
            DeleteCustomers deleteCustomers = new DeleteCustomers();
            deleteCustomers.Customers = this.m_Customers;
            deleteCustomers.Delete();
        }

        public Customers Customers
        {
            get { return m_Customers; }
            set { m_Customers = value; }
        }
    }
}

