using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class KitchenCheckListGroup
    {
         private int m_CheckListGroupId;
         private int m_KitchenCheckListGroupId;        
        private int m_KitchenId;


        public KitchenCheckListGroup()
        {
        }

        public int CheckListGroupId
        {
            get { return m_CheckListGroupId; }
            set { m_CheckListGroupId = value; }
        }
        public int KitchenCheckListGroupId
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
