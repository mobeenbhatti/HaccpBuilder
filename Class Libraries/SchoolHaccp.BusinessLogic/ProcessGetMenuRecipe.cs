using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetMenuRecipe
    {
        private IDataReader m_ResultSet;
        private MenuRecipe m_MenuRecipe;
        private int m_TotalRecords;
        public ProcessGetMenuRecipe()
        {
        }

        public void Invoke()
        {
            GetMenuRecipe getMenuRecipe = new GetMenuRecipe();
            getMenuRecipe.MenuRecipe = this.MenuRecipe;
            this.ResultSet = getMenuRecipe.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }
}
