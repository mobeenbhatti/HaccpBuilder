using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessSetKitchenPlan
    {
         private KitchenPlan m_KitchenPlan;

        public ProcessSetKitchenPlan()
        {
        }

        public void Invoke()
        {
            SetKitchenPlan setKitchenPlan = new SetKitchenPlan();
            setKitchenPlan.Plan = this.m_KitchenPlan;
            setKitchenPlan.Update();
        }

        public KitchenPlan KitchenPlan
        {
            get { return m_KitchenPlan; }
            set { m_KitchenPlan = value; }
        }
    }
}
