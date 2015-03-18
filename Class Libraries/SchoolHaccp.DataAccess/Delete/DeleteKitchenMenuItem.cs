using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteKitchenMenuItem : DataAccessBase
	{
        private KitchenMenuItem m_KitchenMenuItem;

		public DeleteKitchenMenuItem()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenMenuItem.ToString();
		}

		public void Delete()
		{
            DeleteKitchenMenuItemDataParameters createParameters = new DeleteKitchenMenuItemDataParameters(this.m_KitchenMenuItem);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public KitchenMenuItem KitchenMenuItem
		{
            get { return m_KitchenMenuItem; }
            set { m_KitchenMenuItem = value; }
		}
	}

	public class DeleteKitchenMenuItemDataParameters
	{
		private KitchenMenuItem m_KitchenMenuItem;
		object[] m_Parameters;

        public DeleteKitchenMenuItemDataParameters(KitchenMenuItem KitchenMenuItem)
		{
            this.m_KitchenMenuItem = KitchenMenuItem;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_KitchenMenuItem.KitchenId;           
            Parameters = parameters;
		}

        public KitchenMenuItem KitchenMenuItem
		{
            get { return m_KitchenMenuItem; }
            set { m_KitchenMenuItem = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
