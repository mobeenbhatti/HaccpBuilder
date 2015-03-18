
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetIngredient:IBusinessLogic
    {
         private Ingredients m_Ingredient;

        public ProcessSetIngredient()
        {
        }

        public void Invoke()
        {
            SetIngredients setIngredient = new SetIngredients();
            setIngredient.Ingredients = this.m_Ingredient;
            setIngredient.Update();
        }
        public void SetIngredientFoodCategory(int nKitchenId)
        {
            SetIngredients setIngredient = new SetIngredients();
            setIngredient.SetIngredientFoodCategory(nKitchenId);
        }

        public Ingredients Ingredient
        {
            get { return m_Ingredient; }
            set { m_Ingredient = value; }
        }
    }
}
