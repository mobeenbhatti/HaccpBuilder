
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenCheckListGroup : IBusinessLogic
    {
        private KitchenCheckListGroup m_KitchenCheckListGroup;

        public ProcessCreateKitchenCheckListGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenCheckListGroup createkitchenCheckListGroup = new CreateKitchenCheckListGroup();
            createkitchenCheckListGroup.KitchenCheckListGroup = this.m_KitchenCheckListGroup;
            createkitchenCheckListGroup.Insert();
            this.m_KitchenCheckListGroup = createkitchenCheckListGroup.KitchenCheckListGroup;
        }

        public KitchenCheckListGroup kitchenCheckListGroup
        {
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
        }
    }
}
