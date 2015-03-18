using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetMenuItems : DataAccessBase
    {


        public GetMenuItems()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetMenuItemsByKitchenID.ToString();
        }

        public DataSet Get(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            try
            {
                tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
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

        public DataSet GetFoodGroups()
        {
            DataSet tempData;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetFoodGroups");
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
        public DataSet GetMenuItemsByProcess(int nKitchenId, int nProcessId)
        {
            DataSet tempData;
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nProcessId;
            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMenuItemsByProcessID",parameters);
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
        public DataSet GetMealServingMenuItems(DateTime dtSelectedDate, int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = dtSelectedDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMealServingMenuItemsByDate", parameters);
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
        public DataSet GetMealServingDates(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetMealServingDates", parameters);
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
