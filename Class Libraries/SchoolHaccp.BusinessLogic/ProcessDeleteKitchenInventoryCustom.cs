using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenInventoryCustom : IBusinessLogic
    {
        private KitchenInventoryCustom m_KitchenInventoryCustom;

        public ProcessDeleteKitchenInventoryCustom()
        {
        }

        public void Invoke()
        {
            DeleteKitchenInventoryCustom deleteCustomInventory = new DeleteKitchenInventoryCustom();
            deleteCustomInventory.KitchenInventoryCustom = this.m_KitchenInventoryCustom;
            deleteCustomInventory.Delete();
        }

        public KitchenInventoryCustom KitchenInventoryCustom
        {
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
        }
    }
}

