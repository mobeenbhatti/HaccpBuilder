using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenCCPGroup
    {
        private int m_CCPGroupId;
         private int m_KitchenCCPGroupId;        
        private int m_KitchenId;


        public KitchenCCPGroup()
        {
        }

        public int CCPGroupId
        {
            get { return m_CCPGroupId; }
            set { m_CCPGroupId = value; }
        }
        public int KitchenCCPGroupId
        {
            get { return m_KitchenCCPGroupId; }
            set { m_KitchenCCPGroupId = value; }
        }
        
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }        
    }
}
