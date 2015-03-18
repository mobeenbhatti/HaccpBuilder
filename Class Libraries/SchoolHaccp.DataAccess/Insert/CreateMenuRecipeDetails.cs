using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateMenuRecipeDetails : DataAccessBase
    {
        private MenuRecipeDetails m_MenuRecipeDetails;

        public CreateMenuRecipeDetails()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertMenuRecipeDetails.ToString();
        }

        public int Insert()
        {
            int MenuRecipeDetailsId = 0;
            CreateMenuRecipeDetailsDataParameters createParameters = new CreateMenuRecipeDetailsDataParameters(this.m_MenuRecipeDetails);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            return MenuRecipeDetailsId = dataServices.ExecuteNonQuery(createParameters.Parameters);
            //object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            // return MenuRecipeDetailsId = (int)returnValue;

        }       
       
        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
    }

    public class CreateMenuRecipeDetailsDataParameters
    {
        private MenuRecipeDetails m_MenuRecipeDetails;
        object[] m_Parameters;

        public CreateMenuRecipeDetailsDataParameters(MenuRecipeDetails MenuRecipeDetails)
        {
            this.m_MenuRecipeDetails = MenuRecipeDetails;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[6];
            parameters[0] = this.m_MenuRecipeDetails.MenuRecipeID;
            parameters[1] = this.m_MenuRecipeDetails.IngredientID;
            parameters[2] = this.m_MenuRecipeDetails.Specs;
            parameters[3] = this.m_MenuRecipeDetails.EPWeight;
            parameters[4] = this.m_MenuRecipeDetails.EPVolume;
            parameters[5] = this.m_MenuRecipeDetails.EPPercentage;            
            
            Parameters = parameters;
        }

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
