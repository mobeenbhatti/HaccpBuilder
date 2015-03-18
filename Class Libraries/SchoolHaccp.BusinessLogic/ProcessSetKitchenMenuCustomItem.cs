using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetKitchenMenuCustomItem : IBusinessLogic
    {
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

        public ProcessSetKitchenMenuCustomItem()
        {
        }

        public void Invoke()
        {
            SetKitchenMenuCustomItem setCustomInventory = new SetKitchenMenuCustomItem();
            setCustomInventory.KitchenMenuCustomItem = this.m_KitchenMenuCustomItem;
            setCustomInventory.Update();
        }

        public KitchenMenuCustomItem KitchenMenuCustomItem
        {
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
        }
    }
}
