using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetKitchenInventory : IBusinessLogic
    {
        private InventoryItem m_KitchenInventory;

        public ProcessSetKitchenInventory()
        {
        }

        public void Invoke()
        {
            SetKitchenInventory setInventory = new SetKitchenInventory();
            setInventory.KitchenInventory = this.m_KitchenInventory;
            setInventory.Update();
        }

        public void Invoke(string strMode)
        {
            SetKitchenInventory setInventory = new SetKitchenInventory();
            setInventory.KitchenInventory = this.m_KitchenInventory;
            setInventory.Update("php");
        }

        public InventoryItem KitchenInventory
        {
            get { return m_KitchenInventory; }
            set { m_KitchenInventory = value; }
        }
    }
}
