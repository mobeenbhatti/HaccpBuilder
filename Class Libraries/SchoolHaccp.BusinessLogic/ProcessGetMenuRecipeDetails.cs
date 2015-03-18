using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetMenuRecipeDetails
    {
        private IDataReader m_ResultSet;
        private MenuRecipeDetails m_MenuRecipeDetails;
        private int m_TotalRecords;
        public ProcessGetMenuRecipeDetails()
        {
        }

        public void Invoke()
        {
            GetMenuRecipeDetails getMenuRecipeDetails = new GetMenuRecipeDetails();
            getMenuRecipeDetails.MenuRecipeDetails = this.MenuRecipeDetails;
            //this.ResultSet = getMenuRecipeDetails.Get();
        }
        public DataSet GetMenuRecipeDetailsByMenuId(int nMenuItemID)
        {
            DataSet dsRecipeDetails;
            GetMenuRecipeDetails getMenuRecipeDetails = new GetMenuRecipeDetails();            
           dsRecipeDetails = getMenuRecipeDetails.GetMenuRecipeDetailsByMenuId(nMenuItemID);
            return dsRecipeDetails;
        }
        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }
}
