using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessCreateKitchenPlan
    {
         private KitchenPlan m_KitchenPlan;

        public ProcessCreateKitchenPlan()
        {
        }

        public void Invoke()
        {
            CreateKitchenPlan createKitchenPlan = new CreateKitchenPlan();
            createKitchenPlan.Plan = this.m_KitchenPlan;
            createKitchenPlan.Insert();
            this.m_KitchenPlan = createKitchenPlan.Plan;
        }       

        public KitchenPlan KitchenPlan
        {
            get { return m_KitchenPlan; }
            set { m_KitchenPlan = value; }
        }
    }
}
