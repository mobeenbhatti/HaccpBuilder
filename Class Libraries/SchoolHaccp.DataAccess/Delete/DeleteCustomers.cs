using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteCustomers : DataAccessBase
    {
        private Customers m_Customer;

        public DeleteCustomers()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteCustomers.ToString();
        }

        public void Delete()
        {
            DeleteCustomerDataParameters createParameters = new DeleteCustomerDataParameters(this.m_Customer);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }

        public Customers Customers
        {
            get { return m_Customer; }
            set { m_Customer = value; }
        }
    }

    public class DeleteCustomerDataParameters
    {
        private Customers m_Customer;
        object[] m_Parameters;

        public DeleteCustomerDataParameters(Customers Customers)
        {
            this.m_Customer = Customers;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_Customer.CustomerID;
            Parameters = parameters;
        }

        public Customers Customers
        {
            get { return m_Customer; }
            set { m_Customer = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
