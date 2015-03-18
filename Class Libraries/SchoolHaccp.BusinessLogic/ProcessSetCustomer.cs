using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetCustomer : IBusinessLogic
    {
        private Customers m_Customer;

        public ProcessSetCustomer()
        {
        }

        public void Invoke()
        {
            SetCustomers setCustomer = new SetCustomers();
            setCustomer.Customers = this.m_Customer;
            setCustomer.Update();
        }

        public Customers Customer
        {
            get { return m_Customer; }
            set { m_Customer = value; }
        }
    }
}
