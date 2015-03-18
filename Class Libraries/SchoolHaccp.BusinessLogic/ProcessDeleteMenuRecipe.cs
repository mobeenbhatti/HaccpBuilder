using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteMenuRecipe : IBusinessLogic
    {
        private MenuRecipe m_MenuRecipe;

        public ProcessDeleteMenuRecipe()
        {
        }

        public void Invoke()
        {
            DeleteMenuRecipe deleteMenuRecipe = new DeleteMenuRecipe();
            deleteMenuRecipe.MenuRecipe = this.m_MenuRecipe;
            deleteMenuRecipe.Delete();
        }

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }

    }
}
