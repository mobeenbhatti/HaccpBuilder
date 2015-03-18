using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetMenuItemsNew:DataAccessBase
    {private MenuItemsNew  m_MenuItemsNew ;

		public SetMenuItemsNew()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateMenuItemsNew.ToString();
		}

		public void Update()
		{
			SetMenuItemsNewByIdDataParameters setParameters = new SetMenuItemsNewByIdDataParameters(this.m_MenuItemsNew );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}
        public void SetMenuProcess(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices("uspAdm_UpdateMenuProcess");
            dataServices.ExecuteNonQuery(parameters);
        }
		public MenuItemsNew  MenuItemsNew 
		{
			get { return m_MenuItemsNew ; }
			set { m_MenuItemsNew  = value; }
		}
	}

	public class SetMenuItemsNewByIdDataParameters
	{
		private MenuItemsNew  m_MenuItemsNew ;
		object[] m_Parameters;

		public SetMenuItemsNewByIdDataParameters(MenuItemsNew  MenuItemsNew )
		{
			this.m_MenuItemsNew  = MenuItemsNew ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[9];            
            parameters[0] = this.m_MenuItemsNew.MenuItemId;
            parameters[1] = this.m_MenuItemsNew.Name;
            parameters[2] = this.m_MenuItemsNew.PreparationTypeId;
            parameters[3] = this.m_MenuItemsNew.ProcessId;
            parameters[4] = this.m_MenuItemsNew.KitchenId;
            parameters[5] = this.m_MenuItemsNew.RecipeNumber;
            parameters[6] = this.m_MenuItemsNew.Ready;
            parameters[7] = this.m_MenuItemsNew.Instructions;
            parameters[8] = this.m_MenuItemsNew.Selected;
           
            Parameters = parameters;
		}

		public MenuItemsNew  MenuItemsNew 
		{
			get { return m_MenuItemsNew ; }
			set { m_MenuItemsNew  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}


