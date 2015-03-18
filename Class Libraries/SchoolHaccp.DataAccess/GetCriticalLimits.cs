using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess
{
  public  class GetCriticalLimits: DataAccessBase
    {

        public GetCriticalLimits()
        {
            //base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCriticalLimits.ToString();
        }

        public DataSet GetCriticalLimitsDataSet(int nKitchenId, int nLogTypeId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nLogTypeId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenCriticalLimitsByKitchenId", parameters);
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
        //public IDataReader GetCriticalLimitById(int nCriticalLimitId)
        //{
        //    IDataReader tempData;
        //    object[] parameters = new object[1];
        //    parameters[0] = nCriticalLimitId;            
        //    DataServices dataServices = new DataServices();

        //    try
        //    {
        //        tempData = dataServices.ExecuteReader("uspAdm_GetCriticalLimitsById", parameters);
        //        if (tempData == null)
        //        {
        //            throw new Exception("Failed to retrieve data.");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    return tempData;
        //}
        //public IDataReader GetColdHoldingLogByStatusId(int nKitchenId, int nLogTypeId)
        //{
        //    IDataReader tempData;
        //    object[] parameters = new object[2];
        //    parameters[0] = nKitchenId;
        //    parameters[1] = nLogTypeId;
        //    DataServices dataServices = new DataServices();

        //    try
        //    {
        //        tempData = dataServices.ExecuteReader("uspAdm_GetCriticalLimitsByStatusId", parameters);
        //        if (tempData == null)
        //        {
        //            throw new Exception("Failed to retrieve data.");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    return tempData;
        //}
       
        
    }
}
