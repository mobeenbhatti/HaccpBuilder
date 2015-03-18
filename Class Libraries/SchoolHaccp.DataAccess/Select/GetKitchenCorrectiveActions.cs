﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenCorrectiveActions : DataAccessBase
    {

        public GetKitchenCorrectiveActions()
        {
            //base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenCorrectiveAction.ToString();
        }

        public DataSet GetCorrectiveActionsDataSet(int nKitchenId, int nLogTypeId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nLogTypeId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenCorrectiveAction", parameters);
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
                tempData = dataServices.ExecuteReader("uspAdm_GetKitchenCorrectiveActionById", parameters);
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
        public DataSet GetCorrectiveActionByStatusId(int nKitchenId, int nLogTypeId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nLogTypeId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenCorrectiveActionByStatusId", parameters);
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
