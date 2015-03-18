using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateCustomer : IBusinessLogic
    {
        private Customers m_Customer;

        public ProcessCreateCustomer()
        {
        }

        public void Invoke()
        {
            CreateCustomers createCustomer = new CreateCustomers();
            createCustomer.Customers = this.m_Customer;
            createCustomer.Insert();
            this.m_Customer = createCustomer.Customers;
        }
        public void Invoke(string strMode)
        {
            CreateCustomers createCustomer = new CreateCustomers();
            createCustomer.Customers = this.m_Customer;
            createCustomer.Insert("php");

        }
        public IDataReader Upload(string strFileName, int nKitchenId)
        {
            CreateCustomers createCustomer = new CreateCustomers();
            return createCustomer.Upload(strFileName, nKitchenId);

        }


        public Customers Customer
        {
            get { return m_Customer; }
            set { m_Customer = value; }
        }
    }
}

