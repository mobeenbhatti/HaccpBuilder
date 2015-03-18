using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenPlan : IBusinessLogic
    {
        private KitchenPlan m_KitchenPlan;

        public ProcessDeleteKitchenPlan()
        {
        }

        public void Invoke()
        {
            DeleteKitchenPlan deleteKitchenPlan = new DeleteKitchenPlan();
            deleteKitchenPlan.KitchenPlan = this.m_KitchenPlan;
            deleteKitchenPlan.Delete();
        }

        public KitchenPlan KitchenPlan
        {
            get { return m_KitchenPlan; }
            set { m_KitchenPlan = value; }
        }
    }
}
