using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenCheckListGroup : IBusinessLogic
    {
        private KitchenCheckListGroup m_KitchenCheckListGroup;

        public ProcessDeleteKitchenCheckListGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenCheckListGroup deleteKitchenCheckListGroup = new DeleteKitchenCheckListGroup();
            deleteKitchenCheckListGroup.KitchenCheckListGroup = this.m_KitchenCheckListGroup;
            deleteKitchenCheckListGroup.Delete();
        }


        public KitchenCheckListGroup KitchenCheckListGroup
        {
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
        }
    }
}

