using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreateIngredient:IBusinessLogic
    {
        private Ingredients m_Ingredient;

        public ProcessCreateIngredient()
        {
        }

        public void Invoke()
        {
            CreateIngredients createIngredient = new CreateIngredients();
            createIngredient.Ingredients = this.m_Ingredient;
            createIngredient.Insert();
            this.m_Ingredient = createIngredient.Ingredients;
        }
        public void Invoke(string strMode)
        {
            CreateIngredients createIngredient = new CreateIngredients();
            createIngredient.Ingredients = this.m_Ingredient;
            createIngredient.Insert("php");
           
        }
        public IDataReader Upload(string strFileName, int nKitchenId)
        {
            CreateIngredients createIngredient = new CreateIngredients();
           return createIngredient.Upload(strFileName, nKitchenId);         

        }


        public Ingredients Ingredient
        {
            get { return m_Ingredient; }
            set { m_Ingredient = value; }
        }
    }
}
