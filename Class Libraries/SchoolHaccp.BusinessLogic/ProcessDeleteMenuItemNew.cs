using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessDeleteMenuItemNew:IBusinessLogic
    {
        private MenuItemsNew m_MenuItemsNew;

        public ProcessDeleteMenuItemNew()
        {
        }

        public void Invoke()
        {
            DeleteMenuItemsNew deleteMenuItemsNew = new DeleteMenuItemsNew();
            deleteMenuItemsNew.MenuItemsNew = this.m_MenuItemsNew;
            deleteMenuItemsNew.Delete();
        }

        public MenuItemsNew MenuItemsNew
        {
            get { return m_MenuItemsNew; }
            set { m_MenuItemsNew = value; }
        }

    }
}
