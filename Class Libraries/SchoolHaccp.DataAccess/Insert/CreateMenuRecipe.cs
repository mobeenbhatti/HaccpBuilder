using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateMenuRecipe : DataAccessBase
    {
        private MenuRecipe m_MenuRecipe;

        public CreateMenuRecipe()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertMenuRecipe.ToString();
        }

        public int Insert()
        {
            int MenuRecipeId = 0;
            CreateMenuRecipeDataParameters createParameters = new CreateMenuRecipeDataParameters(this.m_MenuRecipe);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            return MenuRecipeId = dataServices.ExecuteNonQuery(createParameters.Parameters);
            //object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            // return MenuRecipeId = (int)returnValue;

        }        
       
        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
    }

    public class CreateMenuRecipeDataParameters
    {
        private MenuRecipe m_MenuRecipe;
        object[] m_Parameters;

        public CreateMenuRecipeDataParameters(MenuRecipe MenuRecipe)
        {
            this.m_MenuRecipe = MenuRecipe;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_MenuRecipe.MenuID;
            parameters[1] = this.m_MenuRecipe.PortionSize;
            parameters[2] = this.m_MenuRecipe.Yield;
            parameters[3] = this.m_MenuRecipe.Preparation;
            parameters[4] = this.m_MenuRecipe.WrittenBy;
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
