using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenFoodCategoryGroup : IBusinessLogic
    {
        private KitchenFoodCategoryGroup m_KitchenFoodCategoryGroup;

        public ProcessDeleteKitchenFoodCategoryGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenFoodCategoryGroup deleteKitchenFoodCategoryGroup = new DeleteKitchenFoodCategoryGroup();
            deleteKitchenFoodCategoryGroup.KitchenFoodCategoryGroup = this.m_KitchenFoodCategoryGroup;
            deleteKitchenFoodCategoryGroup.Delete();
        }


        public KitchenFoodCategoryGroup KitchenFoodCategoryGroup
        {
            get { return m_KitchenFoodCategoryGroup; }
            set { m_KitchenFoodCategoryGroup = value; }
        }
    }
}
