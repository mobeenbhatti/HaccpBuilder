using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenPlan : DataAccessBase
    {

        public GetKitchenPlan()
        {
            //base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenPlan.ToString();
        }

        public DataSet GetPlanDataSet(int nPlanId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nPlanId;
            
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanById", parameters);
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
        public DataSet GetPlanByChildId(int nPlanId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nPlanId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanByChildId", parameters);
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
        public DataSet GetPlanExample(int nPlanId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nPlanId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanExampleById", parameters);
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
        public DataSet GetPlanByCategoryId(int nCategoryId, int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nCategoryId;
            parameters[1] = nKitchenId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanByCategoryId", parameters);
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
        public DataSet GetPlanDetailByCategoryId(int nCategoryId, int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nCategoryId;
            parameters[1] = nKitchenId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanDetailByCategoryId", parameters);
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
        
        public DataSet GetPlanBySortId(int nCategoryId, int nKitchenId,int @nPlanSortId)
        {
            DataSet tempData;
            object[] parameters = new object[3];
            parameters[0] = nCategoryId;
            parameters[1] = nKitchenId;
            parameters[2] = nPlanSortId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanBySortId", parameters);
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
        public DataSet GetPlanByCategorySortId(int nKitchenId, int @nSortId, int @nSideId)
        {
            DataSet tempData;
            object[] parameters = new object[3];
            parameters[0] = nKitchenId;
            parameters[1] = nSortId;
            parameters[2] = nSideId;

            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetKitchenPlanByCategorySortId", parameters);
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
