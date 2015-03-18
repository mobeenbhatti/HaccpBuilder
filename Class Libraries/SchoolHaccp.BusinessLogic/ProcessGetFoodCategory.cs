using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;
namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetFoodCategory : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetFoodCategory()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nFoodCategoryGroupId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            this.ResultSet = FoodCategory.GetFoodCategoryByGroupId(nFoodCategoryGroupId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodCategoryByGroupId(int nFoodCategoryGroupId)
        {
            this.Invoke(nFoodCategoryGroupId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedFoodCategoryByGroupId(int nFoodCategoryGroupId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            this.ResultSet = FoodCategory.GetSelectedFoodCategoryByGroupId(nFoodCategoryGroupId);
            return this.ResultSet;

        }

        public IDataReader GetFoodCategoryById(int nFoodCategoryId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            return FoodCategory.GetFoodCategoryById(nFoodCategoryId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodCategoryByID(int nFoodCategoryId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            return FoodCategory.GetFoodCategoryByID(nFoodCategoryId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodCategoryCorrectiveActions(int nFoodCategoryId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            return FoodCategory.GetFoodCategoryCorrectiveActions(nFoodCategoryId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodCategoryCriticalLimits(int nFoodCategoryId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            return FoodCategory.GetFoodCategoryCriticalLimits(nFoodCategoryId);
        }


        //}
        //public DataSet GetFoodCategoryByKitchenId(int nKitchenId, int nFoodCategoryId)
        //{
        //    GetFoodCategory FoodCategory = new GetFoodCategory();
        //    this.ResultSet = FoodCategory.GetFoodCategoryByKitchenId(nKitchenId, nFoodCategoryId);
        //    return this.ResultSet;

        //}
        public DataSet GetFoodCategoriesByKitchenId(int nKitchenId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            this.ResultSet = FoodCategory.GetFoodCategoriesByKitchenId(nKitchenId);
            return this.ResultSet;
        }
        public DataSet ExportFoodCategoriesByKitchenId(int nKitchenId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            this.ResultSet = FoodCategory.GetFoodCategoriesExport(nKitchenId);
            return this.ResultSet;
        }

        public DataSet GetFoodCategoryByName(string strFoodCategoryName, int nFoodCategoryGroupId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            this.ResultSet = FoodCategory.GetFoodCategoryByName(strFoodCategoryName, nFoodCategoryGroupId);
            return this.ResultSet;

        }
        public DataSet GetFoodCategoryByNameAndId(string strFoodCategoryName, int nFoodCategoryId, int nFoodCategoryGroupId)
        {
            GetFoodCategory FoodCategory = new GetFoodCategory();
            this.ResultSet = FoodCategory.GetFoodCategoryByNameAndId(strFoodCategoryName, nFoodCategoryId, nFoodCategoryGroupId);
            return this.ResultSet;

        }
    }


}