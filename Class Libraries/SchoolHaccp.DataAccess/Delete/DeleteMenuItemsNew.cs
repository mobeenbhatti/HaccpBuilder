using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteMenuItemsNew:DataAccessBase
    { private MenuItemsNew m_MenuItemsNew;

		public DeleteMenuItemsNew()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteMenuItemsNew.ToString();
		}

		public void Delete()
		{
            DeleteMenuItemsNewDataParameters createParameters = new DeleteMenuItemsNewDataParameters(this.m_MenuItemsNew);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public MenuItemsNew MenuItemsNew
		{
            get { return m_MenuItemsNew; }
            set { m_MenuItemsNew = value; }
		}
	}

	public class DeleteMenuItemsNewDataParameters
	{
		private MenuItemsNew m_MenuItemsNew;
		object[] m_Parameters;

        public DeleteMenuItemsNewDataParameters(MenuItemsNew MenuItemsNew)
		{
            this.m_MenuItemsNew = MenuItemsNew;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_MenuItemsNew.MenuItemId;           
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
