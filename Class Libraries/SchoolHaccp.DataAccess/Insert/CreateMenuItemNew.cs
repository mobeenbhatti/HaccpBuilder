using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;


namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateMenuItemsNew : DataAccessBase
    {private MenuItemsNew m_MenuItemsNew;

		public CreateMenuItemsNew()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertMenuItemsNew.ToString();
		}

		public int Insert()
		{
            int MenuItemsNewId = 0;
            CreateMenuItemsNewDataParameters createParameters = new CreateMenuItemsNewDataParameters(this.m_MenuItemsNew);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            return MenuItemsNewId = dataServices.ExecuteNonQuery(createParameters.Parameters);
            //object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
          // return MenuItemsNewId = (int)returnValue;
           
		}
        public void InsertIngredient(int nMenuItemId, int nIngredientId)
        {
            
            object[] parameters = new object[2];
            parameters[0] = nMenuItemId;
            parameters[1] = nIngredientId;
           


            DataServices dataServices = new DataServices("uspAdm_InsertMenuIngredient");
            object returnValue = dataServices.ExecuteScalar(parameters);
        }
        public void Insert(string strMode)
        {
            object[] parameters = new object[8];           
            parameters[0] = this.m_MenuItemsNew.Name;
            parameters[1] = this.m_MenuItemsNew.PreparationTypeId;
            parameters[2] = this.m_MenuItemsNew.ProcessId;
            parameters[3] = this.m_MenuItemsNew.KitchenId;
            parameters[4] = this.m_MenuItemsNew.RecipeNumber;
            parameters[5] = this.m_MenuItemsNew.Ready;
            parameters[6] = this.m_MenuItemsNew.Instructions;
            parameters[7] = this.m_MenuItemsNew.Selected;
           
           
            DataServices dataServices = new DataServices("uspAdm_InsertMenuItemsNewPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public MenuItemsNew MenuItemsNew
		{
            get { return m_MenuItemsNew; }
            set { m_MenuItemsNew = value; }
		}
	}

	public class CreateMenuItemsNewDataParameters
	{
		private MenuItemsNew m_MenuItemsNew;
		object[] m_Parameters;

        public CreateMenuItemsNewDataParameters(MenuItemsNew MenuItemsNew)
		{
            this.m_MenuItemsNew = MenuItemsNew;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[10];
            parameters[0] = this.m_MenuItemsNew.Name;
            parameters[1] = this.m_MenuItemsNew.PreparationTypeId;
            parameters[2] = this.m_MenuItemsNew.ProcessId;
            parameters[3] = this.m_MenuItemsNew.KitchenId;
            parameters[4] = this.m_MenuItemsNew.RecipeNumber;
            parameters[5] = this.m_MenuItemsNew.Ready;
            parameters[6] = this.m_MenuItemsNew.Instructions;
            parameters[7] = this.m_MenuItemsNew.Selected;
            parameters[8] = this.m_MenuItemsNew.EntryDate;
            parameters[9] = 0;
            Parameters = parameters;
		}

        public MenuItemsNew MenuItemsNew
		{
            get { return m_MenuItemsNew; }
            set { m_MenuItemsNew = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
