using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class InventoryItem
    {
        private int m_InventoryItemId;
        private string m_ItemName;
        private int m_Selected;
        private int m_Quantity;
        private string m_SOP;
        private string m_IsCustom;
        private int m_KitchenId;

        public InventoryItem()
        {
        }

        public int InventoryItemId
        {
            get { return m_InventoryItemId; }
            set { m_InventoryItemId = value; }
        }
        public string ItemName
        {
            get { return m_ItemName; }
            set { m_ItemName = value; }
        }
        public int Selected
        {
            get { return m_Selected; }
            set { m_Selected = value; }
        }
        public int Quantity
        {
            get { return m_Quantity; }
            set { m_Quantity = value; }
        }
        public string SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }
        public string IsCustom
        {
            get { return m_IsCustom; }
            set { m_IsCustom = value; }
        }
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }

    }
}



