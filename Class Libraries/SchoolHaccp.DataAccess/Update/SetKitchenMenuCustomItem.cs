using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetKitchenMenuCustomItem : DataAccessBase
	{
		private KitchenMenuCustomItem  m_KitchenMenuCustomItem ;

		public SetKitchenMenuCustomItem()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenMenuCustomItem.ToString();
		}

		public void Update()
		{
			SetKitchenMenuCustomItemByIdDataParameters setParameters = new SetKitchenMenuCustomItemByIdDataParameters(this.m_KitchenMenuCustomItem );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public KitchenMenuCustomItem  KitchenMenuCustomItem 
		{
			get { return m_KitchenMenuCustomItem ; }
			set { m_KitchenMenuCustomItem  = value; }
		}
	}

	public class SetKitchenMenuCustomItemByIdDataParameters
	{
		private KitchenMenuCustomItem  m_KitchenMenuCustomItem ;
		object[] m_Parameters;

		public SetKitchenMenuCustomItemByIdDataParameters(KitchenMenuCustomItem  KitchenMenuCustomItem )
		{
			this.m_KitchenMenuCustomItem  = KitchenMenuCustomItem ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[10];
            parameters[0] = this.m_KitchenMenuCustomItem.KitchenMenuCustomId;
            parameters[1] = this.m_KitchenMenuCustomItem.RecipeNumber;
            parameters[2] = this.m_KitchenMenuCustomItem.Name;
            parameters[3] = this.m_KitchenMenuCustomItem.FoodGroupId;
            parameters[4] = this.m_KitchenMenuCustomItem.PreparationTypeId;
            parameters[5] = this.m_KitchenMenuCustomItem.ProcessId;
            parameters[6] = this.m_KitchenMenuCustomItem.Ready;
            parameters[7] = this.m_KitchenMenuCustomItem.Instructions;
            parameters[8] = this.m_KitchenMenuCustomItem.Selected;
            parameters[9] = this.m_KitchenMenuCustomItem.KitchenId;
            Parameters = parameters;
		}

		public KitchenMenuCustomItem  KitchenMenuCustomItem 
		{
			get { return m_KitchenMenuCustomItem ; }
			set { m_KitchenMenuCustomItem  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
