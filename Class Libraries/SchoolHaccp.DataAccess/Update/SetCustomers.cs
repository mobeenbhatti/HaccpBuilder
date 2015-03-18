using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetCustomers : DataAccessBase
    {
        private Customers m_Customers;

        public SetCustomers()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateCustomers.ToString();
        }

        public void Update()
        {
            SetCustomersByIdDataParameters setParameters = new SetCustomersByIdDataParameters(this.m_Customers);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public Customers Customers
        {
            get { return m_Customers; }
            set { m_Customers = value; }
        }
    }

    public class SetCustomersByIdDataParameters
    {
        private Customers m_Customers;
        object[] m_Parameters;

        public SetCustomersByIdDataParameters(Customers Customers)
        {
            this.m_Customers = Customers;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[11];

            parameters[0] = this.m_Customers.CustomerID;
            parameters[1] = this.m_Customers.CompanyName;
            parameters[2] = this.m_Customers.ContactName;
            parameters[3] = this.m_Customers.Phone;
            parameters[4] = this.m_Customers.Training;
            parameters[5] = this.m_Customers.TrainingDetail;
            parameters[6] = this.m_Customers.CorrectiveAction;
            parameters[7] = this.m_Customers.VerifiedBy;
            parameters[8] = this.m_Customers.VarifiedDate;
            parameters[9] = this.m_Customers.Entrydate;
            parameters[10] = this.m_Customers.KitchenId;
            Parameters = parameters;
        }

        public Customers Customers
        {
            get { return m_Customers; }
            set { m_Customers = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}


