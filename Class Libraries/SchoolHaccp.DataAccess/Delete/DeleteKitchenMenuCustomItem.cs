using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteKitchenMenuCustomItem : DataAccessBase
	{
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

		public DeleteKitchenMenuCustomItem()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenMenuCustomItem.ToString();
		}

		public void Delete()
		{
            DeleteKitchenMenuCustomItemDataParameters createParameters = new DeleteKitchenMenuCustomItemDataParameters(this.m_KitchenMenuCustomItem);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public KitchenMenuCustomItem KitchenMenuCustomItem
		{
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
		}
	}

	public class DeleteKitchenMenuCustomItemDataParameters
	{
		private KitchenMenuCustomItem m_KitchenMenuCustomItem;
		object[] m_Parameters;

        public DeleteKitchenMenuCustomItemDataParameters(KitchenMenuCustomItem KitchenMenuCustomItem)
		{
            this.m_KitchenMenuCustomItem = KitchenMenuCustomItem;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_KitchenMenuCustomItem.KitchenMenuCustomId;           
            Parameters = parameters;
		}

        public KitchenMenuCustomItem KitchenMenuCustomItem
		{
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
