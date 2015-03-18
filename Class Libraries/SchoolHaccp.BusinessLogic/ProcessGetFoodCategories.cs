using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
 public  class ProcessGetFoodCategories:IBusinessLogic
    {
        private IDataReader m_ResultSet;
        //private FoodCategories m_FoodCategories;

        public ProcessGetFoodCategories()
        {
        }

        public void Invoke()
        {
            GetFoodCategories getFoodCategories = new GetFoodCategories();
          //  getFoodCategories.FoodCategories = this.FoodCategories;
          //  this.ResultSet = getFoodCategories.Get();
        }
        public DataSet GetAllFoodCategories()
        {
            GetFoodCategories getFoodCategories = new GetFoodCategories();
            return getFoodCategories.GetFoodCategoriesDataSet();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        //[System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        //public DataSet GetFoodCategoriesByKitchenId(int nKitchenId)
        //{
        //    GetFoodCategories getLog = new GetFoodCategories();
        //    return;
        //        //getLog.GetFoodCategoriesDataSet(nKitchenId);
        //}
        //public IDataReader GetFoodCategoriesByEntryDate(DateTime dtEntryDate, int nKitchenId)
        //{
        //    GetFoodCategories getLog = new GetFoodCategories();
        //    return getLog.GetFoodCategoriesByDate(dtEntryDate, nKitchenId);
        //}

       
        //public FoodCategories FoodCategories
        //{
        //    get { return m_FoodCategories; }
        //    set { m_FoodCategories = value; }
        //}
    }
}
