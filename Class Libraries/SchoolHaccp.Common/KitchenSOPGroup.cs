using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class KitchenSOPGroup
    {
         private int m_SOPGroupId;
         private int m_KitchenSOPGroupId;        
        private int m_KitchenId;


        public KitchenSOPGroup()
        {
        }

        public int SOPGroupId
        {
            get { return m_SOPGroupId; }
            set { m_SOPGroupId = value; }
        }
        public int KitchenSOPGroupId
        {
            get { return m_KitchenSOPGroupId; }
            set { m_KitchenSOPGroupId = value; }
        }
        
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }        
    }
}
