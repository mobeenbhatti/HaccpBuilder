using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateIngredients : DataAccessBase
    {private Ingredients m_Ingredients;

		public CreateIngredients()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertIngredients.ToString();
		}

		public void Insert()
		{
            int IngredientsId = 0;
            CreateIngredientsDataParameters createParameters = new CreateIngredientsDataParameters(this.m_Ingredients);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[6];            
            parameters[0] = this.m_Ingredients.Name;
            parameters[1] = this.m_Ingredients.VendorID;
            parameters[2] = this.m_Ingredients.FoodCategoryID;
            parameters[3] = this.m_Ingredients.EntryDate;
            parameters[4] = this.m_Ingredients.KitchenId;
            parameters[5] = this.m_Ingredients.CCPId;
            
            DataServices dataServices = new DataServices("uspAdm_InsertIngredientsPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        public IDataReader Upload(string strFileName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = strFileName;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertIngredientList");
           return dataServices.ExecuteReader(parameters);

        }

        public Ingredients Ingredients
		{
            get { return m_Ingredients; }
            set { m_Ingredients = value; }
		}
	}

	public class CreateIngredientsDataParameters
	{
		private Ingredients m_Ingredients;
		object[] m_Parameters;

        public CreateIngredientsDataParameters(Ingredients Ingredients)
		{
            this.m_Ingredients = Ingredients;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[6];
            parameters[0] = this.m_Ingredients.Name;
            parameters[1] = this.m_Ingredients.VendorID;
            parameters[2] = this.m_Ingredients.FoodCategoryID;
            parameters[3] = this.m_Ingredients.EntryDate;
            parameters[4] = this.m_Ingredients.KitchenId;
            parameters[5] = this.m_Ingredients.CCPId;

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
