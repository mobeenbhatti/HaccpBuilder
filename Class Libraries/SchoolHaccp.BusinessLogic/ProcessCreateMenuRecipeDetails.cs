using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateMenuRecipeDetails : IBusinessLogic
    {
        private MenuRecipeDetails m_MenuRecipeDetails;

        public ProcessCreateMenuRecipeDetails()
        {
        }
        public int Insert()
        {
            int nMenuRecipeDetailsId;
            CreateMenuRecipeDetails createMenuRecipeDetails = new CreateMenuRecipeDetails();
            createMenuRecipeDetails.MenuRecipeDetails = this.m_MenuRecipeDetails;
            nMenuRecipeDetailsId = createMenuRecipeDetails.Insert();
            this.m_MenuRecipeDetails = createMenuRecipeDetails.MenuRecipeDetails;
            return nMenuRecipeDetailsId;
        }
       

        public void Invoke()
        {
            //CreateMenuRecipeDetails createMenuRecipeDetails = new CreateMenuRecipeDetails();
            //createMenuRecipeDetails.MenuRecipeDetails = this.m_MenuRecipeDetails;
            //createMenuRecipeDetails.Insert();
            //this.m_MenuRecipeDetails = createMenuRecipeDetails.MenuRecipeDetails;
        }
        


        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
    }
}
