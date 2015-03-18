using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Globalization;


using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
	public class GetKitchenInventoryCustom : DataAccessBase
	{
        private KitchenInventoryCustom m_KitchenInventoryCustom;

		public GetKitchenInventoryCustom()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenInventoryCustom.ToString();
		}

		public IDataReader Get()
		{
            GetKitchenInventoryCustomDataParameters getParameters = new GetKitchenInventoryCustomDataParameters(this.m_KitchenInventoryCustom);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			return dataServices.ExecuteReader(getParameters.Parameters);
		}

        public KitchenInventoryCustom KitchenInventoryCustom
		{
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
		}
	}

	public class GetKitchenInventoryCustomDataParameters
	{
		private KitchenInventoryCustom m_KitchenInventoryCustom;
		object[] m_Parameters;

        public GetKitchenInventoryCustomDataParameters(KitchenInventoryCustom kitchenInventoryCustom)
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
