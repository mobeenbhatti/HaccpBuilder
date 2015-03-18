using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetKitchenMenu : DataAccessBase
	{
        private KitchenMenuItem m_KitchenMenu;

		public SetKitchenMenu()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenMenu.ToString();
		}

		public void Update()
		{
			SetKitchenMenuByIdDataParameters setParameters = new SetKitchenMenuByIdDataParameters(this.m_KitchenMenu);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
            //dataServices.ExecuteNonQuery(setParameters.Parameters);
            dataServices.ExecuteScalar(setParameters.Parameters);
		}
        public void Update(string strMode)
        {
            object[] parameters = new object[4];
            parameters[0] = this.m_KitchenMenu.MenuItemId;
            parameters[1] = this.m_KitchenMenu.Selected;
            parameters[2] = this.m_KitchenMenu.PreparationType;
            parameters[3] = this.m_KitchenMenu.KitchenId;
            DataServices dataServices = new DataServices("uspAdm_UpdateKitchenMenuPHP");
            //dataServices.ExecuteNonQuery(setParameters.Parameters);
            dataServices.ExecuteScalar(parameters);
        }

        public KitchenMenuItem KitchenMenu 
		{
			get { return m_KitchenMenu ; }
			set { m_KitchenMenu  = value; }
		}
	}

	public class SetKitchenMenuByIdDataParameters
	{
        private KitchenMenuItem m_KitchenMenu;
		object[] m_Parameters;

        public SetKitchenMenuByIdDataParameters(KitchenMenuItem kitchenMenu)
		{
			this.m_KitchenMenu  = kitchenMenu ;
			Build();
		}

		private void Build()
		{
            //object[] parameters = new object[3];
            //parameters[0] = this.m_KitchenMenu.MenuItemId;
            //parameters[1] = this.m_KitchenMenu.Selected;
            //parameters[2] = this.m_KitchenMenu.PreparationType;
            //Parameters = parameters;
            // Made Changes for MenuITems table structure
            object[] parameters = new object[4];
            parameters[0] = this.m_KitchenMenu.MenuItemId;
            parameters[1] = this.m_KitchenMenu.Selected;
            parameters[2] = this.m_KitchenMenu.PreparationType;
            parameters[3] = this.m_KitchenMenu.KitchenId;
            Parameters = parameters;
		}

        public KitchenMenuItem KitchenMenu 
		{
			get { return m_KitchenMenu ; }
			set { m_KitchenMenu  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
