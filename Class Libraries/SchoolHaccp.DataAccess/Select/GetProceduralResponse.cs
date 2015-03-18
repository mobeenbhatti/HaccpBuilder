using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    
    public class GetProceduralResponse : DataAccessBase
    {

        public GetProceduralResponse()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetProceduralSavedAnswers.ToString();
        }
        public DataSet GetResponsesInfo(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_GetProceduralResponsesInfo");

            try
            {
                DataSet tempData = dataServices.ExecuteDataSet(parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve answers.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dataServices.ExecuteDataSet(parameters);
        }

        

        public DataSet Get(int nKitchenId, int nQuestionId)
        {
            object[] parameters = new object[2];
            parameters[0] = nQuestionId;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            try
            {
                DataSet tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
                if (tempData == null)
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
