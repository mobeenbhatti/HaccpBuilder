using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetFoodCategory : DataAccessBase
    {

        public GetFoodCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetAllFoodCategory.ToString();
        }

        public GetFoodCategory(string strStoreProcedure)
        {
            base.StoredProcedureName = strStoreProcedure;
        }

        public IDataReader Get(int nKitchenId)
        {
            DataServices ds = new DataServices(base.StoredProcedureName);
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            return ds.ExecuteReader(base.StoredProcedureName, parameters);
        }

        //public DataSet Get()
        //{
        //    DataServices ds = new DataServices(base.StoredProcedureName);
        //    return ds.ExecuteDataSet(base.StoredProcedureName);
        //}


        public DataSet GetFoodCategoryByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;


            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetFoodCategoryByGroupId", parameters);
        }

        public DataSet GetSelectedFoodCategoryByGroupId(int nGroupId)
        {
            object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSelectedFoodCategoryByGroupId", parameters);
        }
        public IDataReader GetFoodCategoryById(int nFoodCategoryFoodCategoryId)
        {
            object[] parameters = new object[1];
            parameters[0] = nFoodCategoryFoodCategoryId;

            DataServices ds = new DataServices("uspAdm_GetFoodCategoryById");
            return ds.ExecuteReader(parameters);
        }



        public DataSet GetFoodCategoryByID(int nFoodCategoryFoodCategoryId)
        {
            object[] parameters = new object[1];
            parameters[0] = nFoodCategoryFoodCategoryId;

            DataServices ds = new DataServices("uspAdm_GetFoodCategoryById");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetFoodCategoriesByKitchenId(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices ds = new DataServices("uspAdm_GetFoodCategoriesByKitchenId");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetFoodCategoriesExport(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;

            DataServices ds = new DataServices("uspAdm_GetFoodCategoriesExport");
            return ds.ExecuteDataSet(parameters);
        }
        public IDataReader GetFoodCategoryByIngredientId(int nIngredientId)
        {
            object[] parameters = new object[1];
            parameters[0] = nIngredientId;           

            DataServices ds = new DataServices("uspAdm_GetFoodCategoryByIngredientId");
            return ds.ExecuteReader(parameters);
        }
        public DataSet GetFoodCategoryCriticalLimits(int nFoodCategory)
        {
            object[] parameters = new object[1];
            parameters[0] = nFoodCategory;

            DataServices ds = new DataServices("uspAdm_GetFoodCategoryCriticalLimits");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetFoodCategoryCorrectiveActions(int nFoodCategory)
        {
            object[] parameters = new object[1];
            parameters[0] = nFoodCategory;

            DataServices ds = new DataServices("uspAdm_GetFoodCategoryCorrectiveAction");
            return ds.ExecuteDataSet(parameters);
        }
        public DataSet GetFoodCategoryByNameAndId(string strFoodCategoryName, int nFoodCategoryId, int nFoodCategoryGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = strFoodCategoryName;
            parameters[1] = nFoodCategoryId;
            parameters[2] = nFoodCategoryGroupId;
            return dataServices.ExecuteDataSet("uspAdm_GetFoodCategoryByNameAndId", parameters);
        }
        public DataSet GetFoodCategoryByName(string strFoodCategoryName, int nFoodCategoryGroupId)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = strFoodCategoryName;
            parameters[1] = nFoodCategoryGroupId;

            return dataServices.ExecuteDataSet("uspAdm_GetFoodCategoryByName", parameters);
        }
    }
}