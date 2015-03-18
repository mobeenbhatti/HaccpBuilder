using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteMenuRecipeDetails : IBusinessLogic
    {
        private MenuRecipeDetails m_MenuRecipeDetails;

        public ProcessDeleteMenuRecipeDetails()
        {
        }

        public void Invoke()
        {
            DeleteMenuRecipeDetails deleteMenuRecipeDetails = new DeleteMenuRecipeDetails();
            deleteMenuRecipeDetails.MenuRecipeDetails = this.m_MenuRecipeDetails;
            deleteMenuRecipeDetails.Delete();
        }

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }

    }
}
