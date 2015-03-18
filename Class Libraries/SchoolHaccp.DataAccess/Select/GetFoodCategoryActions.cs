using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
    class GetFoodCategoryActions : DataAccessBase
    {

        public GetFoodCategoryActions()
        {
            //base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenCorrectiveAction.ToString();
        }

        public DataSet GetCorrectiveActionsDataSet(int nFoodCategoryId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nFoodCategoryId;          
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetFoodCategoryCorrectiveAction", parameters);
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
        public IDataReader GetCorrectiveActionById(int nCorrectiveActionId)
        {
            IDataReader tempData;
            object[] parameters = new object[1];
            parameters[0] = nCorrectiveActionId;            
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetFoodCategoryCorrectiveActionById", parameters);
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
        public IDataReader GetCorrectiveActionByStatusId(int nFoodCategoryId)
        {
            IDataReader tempData;
            object[] parameters = new object[1];
            parameters[0] = nFoodCategoryId;
           
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetFoodCategoryCorrectiveActionByStatusId", parameters);
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
