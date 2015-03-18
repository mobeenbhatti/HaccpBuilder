using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;


namespace SchoolHaccp.DataAccess.Select
{
    public class GetValidationResponses : DataAccessBase
    {

        public GetValidationResponses()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetValidationSavedAnswers.ToString();
        }
        public DataSet GetResponsesByHistoryId(int nHistoryId)
        {
            object[] parameters = new object[1];
            parameters[0] = nHistoryId;            
            DataServices dataServices = new DataServices("uspAdm_GetValidationResponsesByHistoryId");

            try
            {
                DataSet tempData = dataServices.ExecuteDataSet("uspAdm_GetValidationResponsesByHistoryId", parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve answers.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dataServices.ExecuteDataSet("uspAdm_GetValidationResponsesByHistoryId", parameters);
        }

        //public GetValidationResponses(string strStoreProcedure)
        //{
        //    base.StoredProcedureName = strStoreProcedure;
        //}

        public DataSet Get(int nKitchenId, int nHistoryId)
        {
            object[] parameters = new object[2];            
            parameters[0] = nHistoryId;
            parameters[1] = nKitchenId;
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
