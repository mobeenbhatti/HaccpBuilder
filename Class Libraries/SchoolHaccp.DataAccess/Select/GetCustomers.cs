using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetCustomers : DataAccessBase
    {
        private Customers m_Customers;

        public GetCustomers()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCustomers.ToString();
        }

        public DataSet GetCustomersDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetCustomersByKitchenId", parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return tempData;
        }
        public IDataReader GetCustomersByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetCustomersByDate", parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return tempData;
        }

        public IDataReader Get()
        {
            GetCustomersDataParameters getParameters = new GetCustomersDataParameters(this.m_Customers);
            DataServices dataServices = new DataServices("uspAdm_GetCustomers");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }
        public DataSet GetCustomersByName(string strName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetCustomersByName");
            return dataServices.ExecuteDataSet(parameters);
        }
        public IDataReader GetCustomersLimit(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetCustomersLimit");
            return dataServices.ExecuteReader(parameters);
        }

        public Customers Customers
        {
            get { return m_Customers; }
            set { m_Customers = value; }
        }
    }

    public class GetCustomersDataParameters
    {
        private Customers m_Customers;
        object[] m_Parameters;

        public GetCustomersDataParameters(Customers Customers)
        {
            this.m_Customers = Customers;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = Customers.CustomerID;
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
