using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
    public class KitchenCtpatGroup
    {
        private int m_CtpatGroupId;
        private int m_KitchenCtpatGroupId;
        private int m_KitchenId;


        public KitchenCtpatGroup()
        {
        }

        public int CtpatGroupId
        {
            get { return m_CtpatGroupId; }
            set { m_CtpatGroupId = value; }
        }
        public int KitchenCtpatGroupId
        {
            get { return m_KitchenCtpatGroupId; }
            set { m_KitchenCtpatGroupId = value; }
        }

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
    }
}
