using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenValidationGroup
    {
        private int m_ValidationGroupId;
         private int m_KitchenValidationGroupId;        
        private int m_KitchenId;


        public KitchenValidationGroup()
        {
        }

        public int ValidationGroupId
        {
            get { return m_ValidationGroupId; }
            set { m_ValidationGroupId = value; }
        }
        public int KitchenValidationGroupId
        {
            get { return m_KitchenValidationGroupId; }
            set { m_KitchenValidationGroupId = value; }
        }
        
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }        
    }
}
