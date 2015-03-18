using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateMenuRecipe : IBusinessLogic
    {
        private MenuRecipe m_MenuRecipe;

        public ProcessCreateMenuRecipe()
        {
        }
        public int Insert()
        {
            int nMenuRecipeId;
            CreateMenuRecipe createMenuRecipe = new CreateMenuRecipe();
            createMenuRecipe.MenuRecipe = this.m_MenuRecipe;
            nMenuRecipeId = createMenuRecipe.Insert();
            this.m_MenuRecipe = createMenuRecipe.MenuRecipe;
            return nMenuRecipeId;
        }
       

        public void Invoke()
        {
            //CreateMenuRecipe createMenuRecipe = new CreateMenuRecipe();
            //createMenuRecipe.MenuRecipe = this.m_MenuRecipe;
            //createMenuRecipe.Insert();
            //this.m_MenuRecipe = createMenuRecipe.MenuRecipe;
        }
        

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
    }
}
