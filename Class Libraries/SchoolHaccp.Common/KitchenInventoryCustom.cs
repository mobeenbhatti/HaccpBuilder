using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenInventoryCustom
    {
       private int m_KitchenInventoryCustomId;
        private string m_Name;
        private int m_CustomInventoryType;
        private int m_Quantity;
        private int  m_Selected;
        private int m_KitchenId;
        private string m_CustomInventoryDesc;

        public KitchenInventoryCustom()
        {
           
        }

        public int KitchenInventoryCustomId
        {
            get { return m_KitchenInventoryCustomId; }
            set { m_KitchenInventoryCustomId = value; }
        }
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        public int CustomInventoryType
        {
            get { return m_CustomInventoryType; }
            set { m_CustomInventoryType = value; }
        }
        public string CustomInventoryDesc
        {
            get { return m_CustomInventoryDesc; }
            set { m_CustomInventoryDesc = value; }
        }
        public int Quantity
        {
            get { return m_Quantity; }
            set { m_Quantity = value; }
        }
        public int Selected
        {
            get { return m_Selected; }
            set { m_Selected = value; }
        }
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }

    }
}



