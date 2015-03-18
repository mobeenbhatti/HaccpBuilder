using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetKitchenMenu : IBusinessLogic
    {
        private KitchenMenuItem m_KitchenMenu;

        public ProcessSetKitchenMenu()
        {
        }

        public void Invoke()
        {
            SetKitchenMenu setMenu = new SetKitchenMenu();
            setMenu.KitchenMenu = this.m_KitchenMenu;
            setMenu.Update();
        }

        public void Invoke(string strMode)
        {
            SetKitchenMenu setMenu = new SetKitchenMenu();
            setMenu.KitchenMenu = this.m_KitchenMenu;
            setMenu.Update("php");
        }

        public KitchenMenuItem KitchenMenu
        {
            get { return m_KitchenMenu; }
            set { m_KitchenMenu = value; }
        }
    }
}
