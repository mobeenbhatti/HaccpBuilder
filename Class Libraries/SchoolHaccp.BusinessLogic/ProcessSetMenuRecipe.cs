using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetMenuRecipe : IBusinessLogic
    {
        private MenuRecipe m_MenuRecipe;

        public ProcessSetMenuRecipe()
        {
        }

        public void Invoke()
        {
            SetMenuRecipe setMenuRecipe = new SetMenuRecipe();
            setMenuRecipe.MenuRecipe = this.m_MenuRecipe;
            setMenuRecipe.Update();
        }

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
    }
}
