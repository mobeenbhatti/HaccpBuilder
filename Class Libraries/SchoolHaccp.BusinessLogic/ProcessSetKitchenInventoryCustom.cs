using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetKitchenInventoryCustom : IBusinessLogic
    {
        private KitchenInventoryCustom m_KitchenInventoryCustom;

        public ProcessSetKitchenInventoryCustom()
        {
        }

        public void Invoke()
        {
            SetKitchenInventoryCustom setCustomInventory = new SetKitchenInventoryCustom();
            setCustomInventory.KitchenInventoryCustom = this.m_KitchenInventoryCustom;
            setCustomInventory.Update();
        }

        public KitchenInventoryCustom KitchenInventoryCustom
        {
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
        }
    }
}
