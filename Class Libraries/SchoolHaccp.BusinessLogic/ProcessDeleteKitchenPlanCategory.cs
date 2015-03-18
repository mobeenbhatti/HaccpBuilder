using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenPlanCategory : IBusinessLogic
    {
        private KitchenPlanCategory m_KitchenPlanCategory;

        public ProcessDeleteKitchenPlanCategory()
        {
        }

        public void Invoke()
        {
            DeleteKitchenPlanCategory deleteKitchenPlanCategory = new DeleteKitchenPlanCategory();
            deleteKitchenPlanCategory.KitchenPlanCategory = this.m_KitchenPlanCategory;
            deleteKitchenPlanCategory.Delete();
        }

        public KitchenPlanCategory KitchenPlanCategory
        {
            get { return m_KitchenPlanCategory; }
            set { m_KitchenPlanCategory = value; }
        }
    }
}
