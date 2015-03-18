using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetKitchenMenuItems : DataAccessBase
	{
		

        public GetKitchenMenuItems()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenMenuItems.ToString();
		}

		public DataSet Get(int nKitchenId, int nPageId)
        {
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nPageId;
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

        public DataSet GetHaccpMenuItem(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            DataSet tempData;

            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenMenuItemHaccp", parameters);
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
