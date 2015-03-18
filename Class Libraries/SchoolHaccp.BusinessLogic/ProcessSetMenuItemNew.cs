using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessSetMenuItemNew:IBusinessLogic
    {
         private MenuItemsNew m_MenuItemNew;

        public ProcessSetMenuItemNew()
        {
        }

        public void Invoke()
        {
            SetMenuItemsNew setMenuItemNew = new SetMenuItemsNew();
            setMenuItemNew.MenuItemsNew = this.m_MenuItemNew;
            setMenuItemNew.Update();
        }

        public MenuItemsNew MenuItemNew
        {
            get { return m_MenuItemNew; }
            set { m_MenuItemNew = value; }
        }
        public void SetMenuProcess(int nKitchenId)
        {
            SetMenuItemsNew setMenuProcess = new SetMenuItemsNew();
            setMenuProcess.SetMenuProcess(nKitchenId);
        }
    }
}
