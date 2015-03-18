using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetMenuRecipe : DataAccessBase
    {
        private MenuRecipe m_MenuRecipe;

        public SetMenuRecipe()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateMenuRecipe.ToString();
        }

        public void Update()
        {
            SetMenuRecipeByIdDataParameters setParameters = new SetMenuRecipeByIdDataParameters(this.m_MenuRecipe);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public MenuRecipe MenuRecipe
        {
            get { return m_MenuRecipe; }
            set { m_MenuRecipe = value; }
        }
    }

    public class SetMenuRecipeByIdDataParameters
    {
        private MenuRecipe m_MenuRecipe;
        object[] m_Parameters;

        public SetMenuRecipeByIdDataParameters(MenuRecipe MenuRecipe)
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
