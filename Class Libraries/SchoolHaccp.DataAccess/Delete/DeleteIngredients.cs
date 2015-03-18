using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using System.Data;


namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteIngredients:DataAccessBase
    { private Ingredients m_Ingredients;

		public DeleteIngredients()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteIngredients.ToString();
		}

		public int Delete()
		{
            DeleteIngredientsDataParameters createParameters = new DeleteIngredientsDataParameters(this.m_Ingredients);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
           IDataReader dr = dataServices.ExecuteReader(createParameters.Parameters);
           if (dr.Read())
           {
               if (dr["Ingredient"].ToString() == "")
               {
                   return 0;
               }
               else
               {
                   return 1;
               }
           }
           else
           {
               return 0;
           }
		}
        public void DeleteByMenuItemId(int nMenuItemId)
        {
            object[] parameters = new object[1];
            parameters[0] = nMenuItemId;
            DataServices dataServices = new DataServices("uspAdm_DeleteMenuIngredientByMenuItemId");
            object returnValue = dataServices.ExecuteScalar(parameters);
        }

        public Ingredients Ingredients
		{
            get { return m_Ingredients; }
            set { m_Ingredients = value; }
		}
	}

	public class DeleteIngredientsDataParameters
	{
		private Ingredients m_Ingredients;
		object[] m_Parameters;

        public DeleteIngredientsDataParameters(Ingredients Ingredients)
		{
            this.m_Ingredients = Ingredients;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_Ingredients.IngredientID;           
            Parameters = parameters;
		}

        public Ingredients Ingredients
		{
            get { return m_Ingredients; }
            set { m_Ingredients = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
