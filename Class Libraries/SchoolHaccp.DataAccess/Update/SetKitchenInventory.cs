using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetKitchenInventory : DataAccessBase
	{
		private InventoryItem  m_KitchenInventory ;

		public SetKitchenInventory()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenInventory.ToString();
		}

		public void Update()
		{
			SetKitchenInventoryByIdDataParameters setParameters = new SetKitchenInventoryByIdDataParameters(this.m_KitchenInventory);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}
        public void Update(string strMode)
        {
            object[] parameters = new object[4];
            parameters[0] = this.m_KitchenInventory.InventoryItemId;            
            parameters[1] = this.m_KitchenInventory.Quantity;
            parameters[2] = this.m_KitchenInventory.Selected;
            parameters[3] = this.m_KitchenInventory.KitchenId;
            DataServices dataServices = new DataServices("uspAdm_UpdateKitchenInventoryPHP");
            dataServices.ExecuteNonQuery(parameters);
        }

		public InventoryItem  KitchenInventory 
		{
			get { return m_KitchenInventory ; }
			set { m_KitchenInventory  = value; }
		}
	}

	public class SetKitchenInventoryByIdDataParameters
	{
		private InventoryItem  m_KitchenInventory ;
		object[] m_Parameters;

		public SetKitchenInventoryByIdDataParameters(InventoryItem  kitchenInventory )
		{
			this.m_KitchenInventory  = kitchenInventory ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[5];
            parameters[0] = this.m_KitchenInventory.InventoryItemId;
            parameters[1] = this.m_KitchenInventory.ItemName;
            parameters[2] = this.m_KitchenInventory.Quantity;
            parameters[3] = this.m_KitchenInventory.Selected;
            parameters[4] = this.m_KitchenInventory.KitchenId;
            Parameters = parameters;
		}

		public InventoryItem  KitchenInventory 
		{
			get { return m_KitchenInventory ; }
			set { m_KitchenInventory  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
