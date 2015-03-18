using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class KitchenProcessGroup
    {
        private int m_ProcessGroupId;
        private int m_KitchenProcessGroupId;
        private int m_KitchenId;


        public KitchenProcessGroup()
        {
        }

        public int ProcessGroupId
        {
            get { return m_ProcessGroupId; }
            set { m_ProcessGroupId = value; }
        }
        public int KitchenProcessGroupId
        {
            get { return m_KitchenProcessGroupId; }
            set { m_KitchenProcessGroupId = value; }
        }

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
    }
}
