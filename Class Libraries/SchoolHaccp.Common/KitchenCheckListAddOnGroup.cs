using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenCheckListAddOnGroup
    {
         private int m_CheckListGroupId;
         private int m_KitchenCheckListGroupId;        
        private int m_KitchenId;


        public KitchenCheckListAddOnGroup()
        {
        }

        public int CheckListAddOnGroupId
        {
            get { return m_CheckListGroupId; }
            set { m_CheckListGroupId = value; }
        }
        public int KitchenCheckListAddOnGroupId
        {
            get { return m_KitchenCheckListGroupId; }
            set { m_KitchenCheckListGroupId = value; }
        }
        
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }        
    }
}
