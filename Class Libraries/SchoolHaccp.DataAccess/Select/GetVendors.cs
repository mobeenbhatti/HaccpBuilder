using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetVendors : DataAccessBase
    {private Vendors m_Vendors;
    private int m_TotalRecords;

        public GetVendors()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetVendors.ToString();
		}

		public DataSet GetVendorsDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecutePagedDataSet("uspAdm_GetVendorsByKitchenId", parameters);
                if (tempData== null)
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
        public DataSet GetVendorsPagedDataSet(int nKitchenId, int nCurrentPageNumber, int nPageSize)
        {
            DataSet tempData;
            object[] parameters = new object[4];
            parameters[0] = nKitchenId;
            parameters[1] = nCurrentPageNumber;
            parameters[2] = nPageSize;
            parameters[3] = 4;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecutePagedDataSet("uspAdm_GetVendorsByKitchenIdPaging", parameters);
                m_TotalRecords = dataServices.nTotalRecords;
               
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
        public IDataReader GetVendorsByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetVendorsByDate", parameters);
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
            GetVendorsDataParameters getParameters = new GetVendorsDataParameters(this.m_Vendors);
            DataServices dataServices = new DataServices("uspAdm_GetVendors");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }
        public DataSet GetVendorsByName(string strName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetVendorsByName");
            return dataServices.ExecuteDataSet(parameters);
        }
        public IDataReader GetVendorsLimit(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetVendorsLimit");
            return dataServices.ExecuteReader(parameters);
        }

        public Vendors Vendors
        {
            get { return m_Vendors; }
            set { m_Vendors = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }

    }

    public class GetVendorsDataParameters
    {
        private Vendors m_Vendors;
        object[] m_Parameters;

        public GetVendorsDataParameters(Vendors Vendors)
        {
            this.m_Vendors = Vendors;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = Vendors.VendorID;
            Parameters = parameters;
        }

        public Vendors Vendors
        {
            get { return m_Vendors; }
            set { m_Vendors = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}
}
