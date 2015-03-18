using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetKitchenPlanCategory
    {
        private KitchenPlanCategory m_KitchenPlanCategory;

        public ProcessSetKitchenPlanCategory()
        {
        }

        public void Invoke()
        {
            SetKitchenPlanCategory setKitchenPlanCategory = new SetKitchenPlanCategory();
            setKitchenPlanCategory.Plan = this.m_KitchenPlanCategory;
            setKitchenPlanCategory.Update();
        }

        public KitchenPlanCategory KitchenPlanCategory
        {
            get { return m_KitchenPlanCategory; }
            set { m_KitchenPlanCategory = value; }
        }
    }
}
