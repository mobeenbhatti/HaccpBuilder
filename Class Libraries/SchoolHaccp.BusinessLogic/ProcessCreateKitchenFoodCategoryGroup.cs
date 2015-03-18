using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenFoodCategoryGroup : IBusinessLogic
    {
        private KitchenFoodCategoryGroup m_KitchenFoodCategoryGroup;

        public ProcessCreateKitchenFoodCategoryGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenFoodCategoryGroup createkitchenFoodCategoryGroup = new CreateKitchenFoodCategoryGroup();
            createkitchenFoodCategoryGroup.KitchenFoodCategoryGroup = this.m_KitchenFoodCategoryGroup;
            createkitchenFoodCategoryGroup.Insert();
            this.m_KitchenFoodCategoryGroup = createkitchenFoodCategoryGroup.KitchenFoodCategoryGroup;
        }

        public KitchenFoodCategoryGroup kitchenFoodCategoryGroup
        {
            get { return m_KitchenFoodCategoryGroup; }
            set { m_KitchenFoodCategoryGroup = value; }
        }
    }
}
