using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class KitchenFoodCategoryGroup
    {
        private int m_FoodCategoryGroupId;
        private int m_KitchenFoodCategoryGroupId;
        private int m_KitchenId;


        public KitchenFoodCategoryGroup()
        {
        }

        public int FoodCategoryGroupId
        {
            get { return m_FoodCategoryGroupId; }
            set { m_FoodCategoryGroupId = value; }
        }
        public int KitchenFoodCategoryGroupId
        {
            get { return m_KitchenFoodCategoryGroupId; }
            set { m_KitchenFoodCategoryGroupId = value; }
        }

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
    }
}