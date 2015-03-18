using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class FoodCategoryGroup
    {
        private int m_FoodCategoryGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public FoodCategoryGroup()
        {
        }

        public int FoodCategoryGroupId
        {
            get { return m_FoodCategoryGroupId; }
            set { m_FoodCategoryGroupId = value; }
        }
        public string GroupName
        {
            get { return m_GroupName; }
            set { m_GroupName = value; }
        }
        public int DistrictId
        {
            get { return m_DistrictId; }
            set { m_DistrictId = value; }
        }
    }
}
