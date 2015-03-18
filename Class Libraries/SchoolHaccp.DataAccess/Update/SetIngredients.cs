using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetIngredients:DataAccessBase
    {private Ingredients  m_Ingredients ;

		public SetIngredients()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateIngredients.ToString();
		}

		public void Update()
		{
			SetIngredientsByIdDataParameters setParameters = new SetIngredientsByIdDataParameters(this.m_Ingredients );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}
        public void SetIngredientFoodCategory(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;            
            DataServices dataServices = new DataServices("uspAdm_UpdateIngredientFoodCategory");
            dataServices.ExecuteNonQuery(parameters);
        }
		public Ingredients  Ingredients 
		{
			get { return m_Ingredients ; }
			set { m_Ingredients  = value; }
		}
	}

	public class SetIngredientsByIdDataParameters
	{
		private Ingredients  m_Ingredients ;
		object[] m_Parameters;

		public SetIngredientsByIdDataParameters(Ingredients  Ingredients )
		{
			this.m_Ingredients  = Ingredients ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[7];           
            parameters[0] = this.m_Ingredients.IngredientID;
            parameters[1] = this.m_Ingredients.Name;
            parameters[2] = this.m_Ingredients.VendorID;
            parameters[3] = this.m_Ingredients.FoodCategoryID;
            parameters[4] = this.m_Ingredients.EntryDate;
            parameters[5] = this.m_Ingredients.KitchenId;
            parameters[6] = this.m_Ingredients.CCPId;
            Parameters = parameters;
		}

		public Ingredients  Ingredients 
		{
			get { return m_Ingredients ; }
			set { m_Ingredients  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}


