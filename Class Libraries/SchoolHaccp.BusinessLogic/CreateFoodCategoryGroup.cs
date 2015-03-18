using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateFoodCategoryGroup : IBusinessLogic
    {
        private FoodCategoryGroup m_FoodCategoryGroup;

        public ProcessCreateFoodCategoryGroup()
        {
        }

        public void Invoke()
        {
            CreateFoodCategoryGroup createFoodCategoryGroup = new CreateFoodCategoryGroup();
            createFoodCategoryGroup.FoodCategoryGroup = this.m_FoodCategoryGroup;
            createFoodCategoryGroup.Insert();
            this.m_FoodCategoryGroup = createFoodCategoryGroup.FoodCategoryGroup;
        }

        public FoodCategoryGroup FoodCategoryGroup
        {
            get { return m_FoodCategoryGroup; }
            set { m_FoodCategoryGroup = value; }
        }
    }
}