using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessDeleteIngredient:IBusinessLogic
    {
        private Ingredients m_Ingredients;

        public ProcessDeleteIngredient()
        {
        }

        public void Invoke()
        {
            //DeleteIngredients deleteIngredients = new DeleteIngredients();
            //deleteIngredients.Ingredients = this.m_Ingredients;
            //deleteIngredients.Delete();
        }
        public int DeleteIngredient()
        {
            int nResult;
            DeleteIngredients deleteIngredients = new DeleteIngredients();
            deleteIngredients.Ingredients = this.m_Ingredients;
            nResult = deleteIngredients.Delete();
            return nResult;
            
        }
        public void DeleteIngredientByMenuItemId(int nMenuItemId)
        {
            DeleteIngredients deleteIngredients = new DeleteIngredients();
            deleteIngredients.DeleteByMenuItemId(nMenuItemId);
        }

        public Ingredients Ingredients
        {
            get { return m_Ingredients; }
            set { m_Ingredients = value; }
        }
    }
}
