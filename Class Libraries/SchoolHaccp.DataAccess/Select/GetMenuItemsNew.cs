using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetMenuItemsNew : DataAccessBase
    {private MenuItemsNew m_MenuItemsNew;
    private int m_TotalRecords;
        public GetMenuItemsNew()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetMenuItemsNew.ToString();
		}

		public DataSet GetMenuItemsNewDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMenuItemsNewDataSet", parameters);
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
        public DataSet GetMenuItemsNewByKitchenId(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMenuItemsNewByKitchenId", parameters);
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
        public DataSet GetMenuItemsNewByKitchenIdPaging(int nKitchenId, int nCurrentPageNumber, int nPageSize)
        {
            DataSet tempData;
            object[] parameters = new object[4];
            parameters[0] = nKitchenId;
            parameters[1] = nCurrentPageNumber;
            parameters[2] = nPageSize;
            parameters[3] = 0;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecutePagedDataSet("uspAdm_GetMenuItemsNewByKitchenIdPaging", parameters);
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
        public IDataReader GetMenuItemsNewByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetMenuItemsNewByDate", parameters);
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
            GetMenuItemsNewDataParameters getParameters = new GetMenuItemsNewDataParameters(this.m_MenuItemsNew);
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemsNew");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public DataSet GetMenuItemsByName(string strName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemsNewByName");
            return dataServices.ExecuteDataSet(parameters);
        }
        public DataSet GetDistinctMenuItemsByName(string strName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemsNewDistinctByName");
            return dataServices.ExecuteDataSet(parameters);
        }
        public IDataReader GetMenuItemsLimit(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemsLimit");
            return dataServices.ExecuteReader(parameters);
        }
        public DataSet GetMenuItemsByProcess(int nKitchenId, int nProcessId)
        {
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nProcessId;
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemsNewByProcess");
            return dataServices.ExecuteDataSet(parameters);
        }
        public DataSet GetMenuItemsNewDataSetByProcess(int nKitchenId, int nProcessId)
        {
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nProcessId;
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemsNewDataSetByProcess");
            return dataServices.ExecuteDataSet(parameters);
        }
       
        public int GetMaxMenuItemId()
        {
            int nMenuItemId = 1;
            DataServices dataServices = new DataServices();
            IDataReader dr = dataServices.ExecuteReader("uspAdm_GetMenuItemsNewId");
            if (dr.Read())
            {
                nMenuItemId =  int.Parse(dr["MenuItemId"].ToString());
            }
            return nMenuItemId;
        }


        public MenuItemsNew MenuItemsNew
        {
            get { return m_MenuItemsNew; }
            set { m_MenuItemsNew = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }

    public class GetMenuItemsNewDataParameters
    {
        private MenuItemsNew m_MenuItemsNew;
        object[] m_Parameters;

        public GetMenuItemsNewDataParameters(MenuItemsNew MenuItemsNew)
        {
            this.m_MenuItemsNew = MenuItemsNew;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = MenuItemsNew.MenuItemId;
            Parameters = parameters;
        }

        public MenuItemsNew MenuItemsNew
        {
            get { return m_MenuItemsNew; }
            set { m_MenuItemsNew = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}
}
