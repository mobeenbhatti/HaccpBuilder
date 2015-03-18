using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   
    public class ProcessCreateFoodCategory : IBusinessLogic
    {
      
        private FoodCategories m_FoodCategory;
        private FoodCategoryAction m_CorrectiveAction;

        public ProcessCreateFoodCategory()
        {
        }

        public void Invoke()
        {
            CreateFoodCategory createFoodCategory = new CreateFoodCategory();
            createFoodCategory.FoodCategory = this.FoodCategory;
            createFoodCategory.Insert();
            this.FoodCategory = createFoodCategory.FoodCategory;
        }
        public void InsertFoodCategoryCorrectiveAction()
        {
            CreateFoodCategory createFoodCategory = new CreateFoodCategory();
            createFoodCategory.CorrectiveAction = this.CorrectiveAction;
            createFoodCategory.InsertCorrectiveAction();            
        }
        public void InsertFoodCategoryCriticalLimits()
        {
            CreateFoodCategory createFoodCategory = new CreateFoodCategory();
            createFoodCategory.FoodCategory = this.FoodCategory;
            createFoodCategory.InsertCriticalLimits();
            
        }

        public FoodCategories FoodCategory
        {
            get { return m_FoodCategory; }
            set { m_FoodCategory = value; }
        }
        public FoodCategoryAction CorrectiveAction
        {
            get { return m_CorrectiveAction; }
            set { m_CorrectiveAction = value; }
        }
    }
}
