using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenMenuItem : IBusinessLogic
    {
        private KitchenMenuItem m_KitchenMenuItem;

        public ProcessDeleteKitchenMenuItem()
        {
        }

        public void Invoke()
        {
            DeleteKitchenMenuItem deleteKitchenMenuItem = new DeleteKitchenMenuItem();
            deleteKitchenMenuItem.KitchenMenuItem = this.m_KitchenMenuItem;
            deleteKitchenMenuItem.Delete();
        }

        public KitchenMenuItem KitchenMenuItem
        {
            get { return m_KitchenMenuItem; }
            set { m_KitchenMenuItem = value; }
        }
    }
}

