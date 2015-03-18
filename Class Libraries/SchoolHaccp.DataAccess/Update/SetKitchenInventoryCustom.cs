using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetKitchenInventoryCustom : DataAccessBase
	{
		private KitchenInventoryCustom  m_KitchenInventoryCustom ;

		public SetKitchenInventoryCustom()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenInventoryCustom.ToString();
		}

		public void Update()
		{
			SetKitchenInventoryCustomByIdDataParameters setParameters = new SetKitchenInventoryCustomByIdDataParameters(this.m_KitchenInventoryCustom );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public KitchenInventoryCustom  KitchenInventoryCustom 
		{
			get { return m_KitchenInventoryCustom ; }
			set { m_KitchenInventoryCustom  = value; }
		}
	}

	public class SetKitchenInventoryCustomByIdDataParameters
	{
		private KitchenInventoryCustom  m_KitchenInventoryCustom ;
		object[] m_Parameters;

		public SetKitchenInventoryCustomByIdDataParameters(KitchenInventoryCustom  kitchenInventoryCustom )
		{
			this.m_KitchenInventoryCustom  = kitchenInventoryCustom ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[6];
            parameters[0] = this.m_KitchenInventoryCustom.KitchenInventoryCustomId;
            parameters[1] = this.m_KitchenInventoryCustom.Name;
            parameters[2] = this.m_KitchenInventoryCustom.CustomInventoryDesc;
            parameters[3] = this.m_KitchenInventoryCustom.Quantity;
            parameters[4] = this.m_KitchenInventoryCustom.Selected;
            parameters[5] = this.m_KitchenInventoryCustom.KitchenId;
            //parameters[5] = this.m_KitchenInventoryCustom.CustomInventoryDesc;
            Parameters = parameters;
		}

		public KitchenInventoryCustom  KitchenInventoryCustom 
		{
			get { return m_KitchenInventoryCustom ; }
			set { m_KitchenInventoryCustom  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
