using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetCustomInventory : DataAccessBase
	{
		

        public GetCustomInventory()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCustomInventoryByKitchenID.ToString();
		}

		public DataSet Get(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            DataSet tempData;
            
            try
            {
                tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
                if (tempData== null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            //return dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
            return tempData;
        }

        public DataSet GetCustomTypes(int nKitchenId)
        {
            DataSet tempData;
            DataServices dataServices = new DataServices();
            try
            {
                object[] parameters = new object[1];
                parameters[0] = nKitchenId;
                tempData = dataServices.ExecuteDataSet("uspAdm_GetCustomInventoryTypes",parameters);                   
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
		
	}

	
}
