using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteFoodCategory : IBusinessLogic
    {
        private FoodCategories m_FoodCategory;

        public ProcessDeleteFoodCategory()
        {
        }

        public void Invoke()
        {
            DeleteFoodCategory deleteFoodCategory = new DeleteFoodCategory();
            deleteFoodCategory.FoodCategory = this.m_FoodCategory;
            deleteFoodCategory.Delete();
        }

        public FoodCategories FoodCategory
        {
            get { return m_FoodCategory; }
            set { m_FoodCategory = value; }
        }
    }
}
