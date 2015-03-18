using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateCustomers : DataAccessBase
    {
        private Customers m_Customer;

        public CreateCustomers()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertCustomers.ToString();
        }

        public void Insert()
        {
            int CustomersId = 0;
            CreateCustomerDataParameters createParameters = new CreateCustomerDataParameters(this.m_Customer);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }
        public void Insert(string strMode)
        {
            object[] parameters = new object[10];
            parameters[0] = this.m_Customer.CompanyName;
            parameters[1] = this.m_Customer.ContactName;
            parameters[2] = this.m_Customer.Phone;
            parameters[3] = this.m_Customer.Training;
            parameters[4] = this.m_Customer.TrainingDetail;
            parameters[5] = this.m_Customer.CorrectiveAction;
            parameters[6] = this.m_Customer.VerifiedBy;
            parameters[7] = this.m_Customer.VarifiedDate;
            parameters[8] = this.m_Customer.Entrydate;
            parameters[9] = this.m_Customer.KitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertCustomerPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        public IDataReader Upload(string strFileName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strFileName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertCustomerList");
            //DataServices dataServices = new DataServices("uspAdm_InsertVendorListTest");
            return dataServices.ExecuteReader(parameters);

        }

        public Customers Customers
        {
            get { return m_Customer; }
            set { m_Customer = value; }
        }
    }

    public class CreateCustomerDataParameters
    {
        private Customers m_Customer;
        object[] m_Parameters;

        public CreateCustomerDataParameters(Customers Customers)
        {
            this.m_Customer = Customers;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[10];
            parameters[0] = this.m_Customer.CompanyName;
            parameters[1] = this.m_Customer.ContactName;
            parameters[2] = this.m_Customer.Phone;
            parameters[3] = this.m_Customer.Training;
            parameters[4] = this.m_Customer.TrainingDetail;
            parameters[5] = this.m_Customer.CorrectiveAction;
            parameters[6] = this.m_Customer.VerifiedBy;
            parameters[7] = this.m_Customer.VarifiedDate;
            parameters[8] = this.m_Customer.Entrydate;
            parameters[9] = this.m_Customer.KitchenId;
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
