using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
  public class ProcessCreateKitchenPlanCategory
    {
         private KitchenPlanCategory m_KitchenPlanCategory;

        public ProcessCreateKitchenPlanCategory()
        {
        }

        public void Invoke()
        {
            CreateKitchenPlanCategory createKitchenPlanCategory = new CreateKitchenPlanCategory();
            createKitchenPlanCategory.Plan = this.m_KitchenPlanCategory;
            createKitchenPlanCategory.Insert();
            this.m_KitchenPlanCategory = createKitchenPlanCategory.Plan;
        }
        public void CreateKitchenPlanCategoryCustom(int KitchenId, int KitchenPlanCategoryId, string Title)
        {
            CreateKitchenPlanCategory createKitchenPlanCategory = new CreateKitchenPlanCategory();
            createKitchenPlanCategory.CreateKitchenPlanCategoryCustom(KitchenId, KitchenPlanCategoryId, Title);
        }

        public KitchenPlanCategory KitchenPlanCategory
        {
            get { return m_KitchenPlanCategory; }
            set { m_KitchenPlanCategory = value; }
        }
    }
}
