using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteMenuRecipe : DataAccessBase
    {
        private MenuRecipe m_MenuRecipe;

        public DeleteMenuRecipe()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteMenuRecipe.ToString();
        }

        public void Delete()
        {
            DeleteMenuRecipeDataParameters createParameters = new DeleteMenuRecipeDataParameters(this.m_MenuRecipe);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
    }

    public class DeleteMenuRecipeDataParameters
    {
        private MenuRecipe m_MenuRecipe;
        object[] m_Parameters;

        public DeleteMenuRecipeDataParameters(MenuRecipe MenuRecipe)
        {
            this.m_MenuRecipe = MenuRecipe;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_MenuRecipe.MenuRecipeID;
            Parameters = parameters;
        }

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
