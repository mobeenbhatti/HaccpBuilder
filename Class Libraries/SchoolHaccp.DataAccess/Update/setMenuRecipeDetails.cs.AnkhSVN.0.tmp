using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetMenuRecipeDetails : DataAccessBase
    {
        private MenuRecipeDetails m_MenuRecipeDetails;

        public SetMenuRecipeDetails()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateMenuRecipeDetails.ToString();
        }

        public void Update()
        {
            SetMenuRecipeDetailsByIdDataParameters setParameters = new SetMenuRecipeDetailsByIdDataParameters(this.m_MenuRecipeDetails);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }
        public void UpdateIngredients(int nMenuItemId)
        {
            object[] parameters = new object[1];
            parameters[0] = nMenuItemId;           
            DataServices dataServices = new DataServices("uspAdm_UpdateMenuRecipeDetailsByIngredients");
            dataServices.ExecuteNonQuery(parameters);
        }
        public void UpdateSortOrder(int nOriginalId, int nNewId)
        {
            object[] parameters = new object[2];
            parameters[0] = nOriginalId;
            parameters[1] = nNewId;
            DataServices ds = new DataServices();

            ds.ExecuteNonQuery("uspAdm_UpdateMenuRecipeDetailSortOrder", parameters);
        }
        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
    }

    public class SetMenuRecipeDetailsByIdDataParameters
    {
        private MenuRecipeDetails m_MenuRecipeDetails;
        object[] m_Parameters;

        public SetMenuRecipeDetailsByIdDataParameters(MenuRecipeDetails MenuRecipeDetails)
        {
            this.m_MenuRecipeDetails = MenuRecipeDetails;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[8];
            parameters[0] = this.m_MenuRecipeDetails.MenuRecipeID;
            parameters[1] = this.m_MenuRecipeDetails.IngredientID;
            parameters[2] = this.m_MenuRecipeDetails.SortOrder;
            parameters[3] = this.m_MenuRecipeDetails.Specs;
            parameters[4] = this.m_MenuRecipeDetails.EPWeight;
            parameters[5] = this.m_MenuRecipeDetails.EPVolume;
            parameters[6] = this.m_MenuRecipeDetails.EPPercentage;
            parameters[7] = this.m_MenuRecipeDetails.MenuRecipeDetailID;
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
