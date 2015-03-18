using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
  public  class GetPestLog
    {
      public DataSet GetPestLogDataSet(int nKitchenId)
      {
          DataSet tempData;
          object[] parameters = new object[1];
          parameters[0] = nKitchenId;
          DataServices dataServices = new DataServices();

          try
          {
              tempData = dataServices.ExecuteDataSet("uspAdm_GetPestLogByKitchenId", parameters);
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
      public DataSet GetPestLogDataSetByMobileId(int nKitchenId,int nMobileId)
      {
          DataSet tempData;
          object[] parameters = new object[2];
          parameters[0] = nKitchenId;
          parameters[1] = nMobileId;
          DataServices dataServices = new DataServices();

          try
          {
              tempData = dataServices.ExecuteDataSet("uspAdm_GetPestLogByMobileId", parameters);
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
      public DataSet GetPestLogInventory(int nKitchenId)
      {
          DataSet tempData;
          object[] parameters = new object[1];
          parameters[0] = nKitchenId;
          DataServices dataServices = new DataServices();

          try
          {
              tempData = dataServices.ExecuteDataSet("uspAdm_GetPestLogInventory", parameters);
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
