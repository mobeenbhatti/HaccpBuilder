using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetFoodSafetyResponses : DataAccessBase
    {

        public GetFoodSafetyResponses()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetSavedAnswers.ToString();
        }
        public DataSet GetResponsesByHistoryId(int nHistoryId)
        {
            object[] parameters = new object[1];
            parameters[0] = nHistoryId;            
            DataServices dataServices = new DataServices("uspAdm_GetFoodSafetyResponsesByHistoryId");

            try
            {
                DataSet tempData = dataServices.ExecuteDataSet("uspAdm_GetFoodSafetyResponsesByHistoryId", parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve answers.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dataServices.ExecuteDataSet("uspAdm_GetFoodSafetyResponsesByHistoryId", parameters);
        }

        //public GetFoodSafetyResponses(string strStoreProcedure)
        //{
        //    base.StoredProcedureName = strStoreProcedure;
        //}

        public DataSet Get(int nKitchenId, int nHistoryId, int nPageIndex)
        {
            object[] parameters = new object[3];
            parameters[0] = nPageIndex;
            parameters[1] = nHistoryId;
            parameters[2] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            
            try
            {
                DataSet tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
                if (tempData== null)
                {
                    throw new Exception("Failed to retrieve answers.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
        }

        //public DataSet Get(int nHistoryId, int nStartIndex,int nLastIndex)
        //{
        //    object[] parameters = new object[3];
        //    parameters[0] = nStartIndex;
        //    parameters[1] = nHistoryId;
        //    parameters[2] = nLastIndex;
        //    DataServices dataServices = new DataServices(base.StoredProcedureName);
        //    return dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
        //}


       
    }

    
}


