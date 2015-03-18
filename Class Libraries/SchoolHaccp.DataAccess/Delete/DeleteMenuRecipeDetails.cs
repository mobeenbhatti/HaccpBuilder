using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteMenuRecipeDetails : DataAccessBase
    {
        private MenuRecipeDetails m_MenuRecipeDetails;

        public DeleteMenuRecipeDetails()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteMenuRecipeDetails.ToString();
        }

        public void Delete()
        {
            DeleteMenuRecipeDetailsDataParameters createParameters = new DeleteMenuRecipeDetailsDataParameters(this.m_MenuRecipeDetails);
            DataServices dataServices = new DataServices("uspAdm_DeleteMenuRecipeDetailsByMenuRecipeID");
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }

        public MenuRecipeDetails MenuRecipeDetails
        {
            get { return m_MenuRecipeDetails; }
            set { m_MenuRecipeDetails = value; }
        }
    }

    public class DeleteMenuRecipeDetailsDataParameters
    {
        private MenuRecipeDetails m_MenuRecipeDetails;
        object[] m_Parameters;

        public DeleteMenuRecipeDetailsDataParameters(MenuRecipeDetails MenuRecipeDetails)
        {
            this.m_MenuRecipeDetails = MenuRecipeDetails;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_MenuRecipeDetails.MenuRecipeID;
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
