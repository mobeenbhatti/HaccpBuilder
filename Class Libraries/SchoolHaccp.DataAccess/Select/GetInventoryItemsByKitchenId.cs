using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetInventoryItemsByKitchenId : DataAccessBase
	{
		

        public GetInventoryItemsByKitchenId()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetInventoryItemByKitchenID.ToString();
		}

		public DataSet Get(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            
            try
            {
                DataSet tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
                if (tempData== null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
        }

        public DataSet GetHaccpInventory(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                DataSet tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenInventoryManager", parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dataServices.ExecuteDataSet("uspAdm_GetKitchenInventoryManager", parameters);
        }
		
	}

	
}
