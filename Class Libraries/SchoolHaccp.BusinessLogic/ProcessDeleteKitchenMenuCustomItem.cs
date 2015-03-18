using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenMenuCustomItem : IBusinessLogic
    {
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

        public ProcessDeleteKitchenMenuCustomItem()
        {
        }

        public void Invoke()
        {
            DeleteKitchenMenuCustomItem deleteCustomInventory = new DeleteKitchenMenuCustomItem();
            deleteCustomInventory.KitchenMenuCustomItem = this.m_KitchenMenuCustomItem;
            deleteCustomInventory.Delete();
        }

        public KitchenMenuCustomItem KitchenMenuCustomItem
        {
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
        }
    }
}

