using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetMenuRecipe : DataAccessBase
    {
        private MenuRecipe m_MenuRecipe;
        private int m_TotalRecords;
        public GetMenuRecipe()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetMenuRecipe.ToString();
        }        
        public IDataReader Get()
        {
            GetMenuRecipeDataParameters getParameters = new GetMenuRecipeDataParameters(this.m_MenuRecipe);
            DataServices dataServices = new DataServices("uspAdm_GetMenuItemRecipeByMenuId");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }
        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
       
    }

    public class GetMenuRecipeDataParameters
    {
        private MenuRecipe m_MenuRecipe;
        object[] m_Parameters;

        public GetMenuRecipeDataParameters(MenuRecipe MenuRecipe)
        {
            this.m_MenuRecipe = MenuRecipe;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = MenuRecipe.MenuID;
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
