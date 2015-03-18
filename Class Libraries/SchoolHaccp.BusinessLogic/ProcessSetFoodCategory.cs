using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetFoodCategory : IBusinessLogic
    {
        private FoodCategories m_FoodCategory;
        private FoodCategoryAction m_CorrectiveAction;

        public ProcessSetFoodCategory()
        {
        }

        public void Invoke()
        {
            SetFoodCategory setFoodCategory = new SetFoodCategory();
            setFoodCategory.FoodCategory = this.m_FoodCategory;
            setFoodCategory.Update();
        }
        public void FoodCategorySelection()
        {
            SetFoodCategory setFoodCategory = new SetFoodCategory();
            setFoodCategory.FoodCategory = this.m_FoodCategory;
            setFoodCategory.UpdateSelection();
            
        }

        public void FoodCategoryCorrectiveActions()
        {
            SetFoodCategory setFoodCategory = new SetFoodCategory();
            setFoodCategory.CorrectiveAction = this.m_CorrectiveAction;
            setFoodCategory.UpdateFoodCategoryCorrectiveActions();
        }
        public void FoodCategoryCriticalLimits()
        {
            SetFoodCategory setFoodCategory = new SetFoodCategory();
            setFoodCategory.FoodCategory = this.m_FoodCategory;
            setFoodCategory.UpdateFoodCategoryCriticalLimits();
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

