using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteKitchenInventoryCustom : DataAccessBase
	{
        private KitchenInventoryCustom m_KitchenInventoryCustom;

		public DeleteKitchenInventoryCustom()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenInventoryCustom.ToString();
		}

		public void Delete()
		{
            DeleteKitchenInventoryCustomDataParameters createParameters = new DeleteKitchenInventoryCustomDataParameters(this.m_KitchenInventoryCustom);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public KitchenInventoryCustom KitchenInventoryCustom
		{
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
		}
	}

	public class DeleteKitchenInventoryCustomDataParameters
	{
		private KitchenInventoryCustom m_KitchenInventoryCustom;
		object[] m_Parameters;

        public DeleteKitchenInventoryCustomDataParameters(KitchenInventoryCustom kitchenInventoryCustom)
		{
            this.m_KitchenInventoryCustom = kitchenInventoryCustom;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_KitchenInventoryCustom.KitchenInventoryCustomId;           
            Parameters = parameters;
		}

        public KitchenInventoryCustom KitchenInventoryCustom
		{
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
