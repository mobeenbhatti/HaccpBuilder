using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetMenuRecipeDetails : IBusinessLogic
    {
        private MenuRecipeDetails m_MenuRecipeDetails;

        public ProcessSetMenuRecipeDetails()
        {
        }

        public void Invoke()
        {
            SetMenuRecipeDetails setMenuRecipeDetails = new SetMenuRecipeDetails();
            setMenuRecipeDetails.MenuRecipeDetails = this.m_MenuRecipeDetails;
            setMenuRecipeDetails.Update();
        }

        public void UpdateIngredients(int nMenuItemId)
        {
            SetMenuRecipeDetails setMenuRecipeDetails = new SetMenuRecipeDetails();           
            setMenuRecipeDetails.UpdateIngredients(nMenuItemId);
        }

        public void UpdateSortOrder(int nOriginalId, int nNewId)
        {
            SetMenuRecipeDetails setMenuRecipeDetails = new SetMenuRecipeDetails();
            setMenuRecipeDetails.UpdateSortOrder(nOriginalId,nNewId);
        }

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
    }
}
