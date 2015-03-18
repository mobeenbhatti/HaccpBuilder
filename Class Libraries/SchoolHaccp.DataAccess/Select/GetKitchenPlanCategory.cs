using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
   public class GetKitchenPlanCategory : DataAccessBase
    {
        public GetKitchenPlanCategory()
        {
            //base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenPlan.ToString();
        }

        public DataSet GetPlanCategoryById(int nCategoryId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nCategoryId;
            
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanCategoryById", parameters);
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
        public DataSet GetPlanCategoryDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanCategoryByKitchenId", parameters);
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
        public DataSet GetPlanCategorySideDataSet(int nKitchenId, int nSubId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nSubId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanCategorySideByKitchenId", parameters);
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
        public DataSet GetPlanCategoryBySortId(int nKitchenId, int nSortOrder)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nSortOrder;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanCategoryBySortIdId", parameters);
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
