using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessDeleteKitchenCheckListAddOnGroup
    {
         private KitchenCheckListAddOnGroup m_KitchenCheckListGroup;

         public ProcessDeleteKitchenCheckListAddOnGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenCheckListAddOnGroup deleteKitchenCheckListGroup = new DeleteKitchenCheckListAddOnGroup();
            deleteKitchenCheckListGroup.KitchenCheckListGroup = this.m_KitchenCheckListGroup;
            deleteKitchenCheckListGroup.Delete();
        }


        public KitchenCheckListAddOnGroup KitchenCheckListGroup
        {
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
        }
    }
}
