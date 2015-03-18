using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateMenuItemNew:IBusinessLogic
    {
        private MenuItemsNew m_MenuItemNew;

        public ProcessCreateMenuItemNew()
        {
        }
        public int Insert()
        {
            int nMenuItemsNewId;
            CreateMenuItemsNew createMenuItemNew = new CreateMenuItemsNew();
            createMenuItemNew.MenuItemsNew = this.m_MenuItemNew;
            nMenuItemsNewId =  createMenuItemNew.Insert();
            this.m_MenuItemNew = createMenuItemNew.MenuItemsNew;
            return nMenuItemsNewId;
        }
        public void InsertMenuIngredient(int nMenuItemId, int nIngredientId)
        {
            CreateMenuItemsNew createMenuIngredient = new CreateMenuItemsNew();
            createMenuIngredient.InsertIngredient(nMenuItemId, nIngredientId);
        }


        public void Invoke()
        {
            //CreateMenuItemsNew createMenuItemNew = new CreateMenuItemsNew();
            //createMenuItemNew.MenuItemsNew = this.m_MenuItemNew;
            //createMenuItemNew.Insert();
            //this.m_MenuItemNew = createMenuItemNew.MenuItemsNew;
        }
        public void Invoke(string strMode)
        {
            CreateMenuItemsNew createMenuItemNew = new CreateMenuItemsNew();
            createMenuItemNew.MenuItemsNew = this.m_MenuItemNew;
            createMenuItemNew.Insert("php");
           
        }


        public MenuItemsNew MenuItemNew
        {
            get { return m_MenuItemNew; }
            set { m_MenuItemNew = value; }
        }
    }
}
