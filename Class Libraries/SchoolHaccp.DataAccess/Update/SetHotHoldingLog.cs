using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetHotHoldingLog : DataAccessBase
	{
		private HotHoldingLog  m_HotHoldingLog ;

		public SetHotHoldingLog()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateHotHoldingLog.ToString();
		}

		public void Update()
		{
			SetHotHoldingLogByIdDataParameters setParameters = new SetHotHoldingLogByIdDataParameters(this.m_HotHoldingLog );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public HotHoldingLog  HotHoldingLog 
		{
			get { return m_HotHoldingLog ; }
			set { m_HotHoldingLog  = value; }
		}
	}

	public class SetHotHoldingLogByIdDataParameters
	{
		private HotHoldingLog  m_HotHoldingLog ;
		object[] m_Parameters;

		public SetHotHoldingLogByIdDataParameters(HotHoldingLog  HotHoldingLog )
		{
			this.m_HotHoldingLog  = HotHoldingLog ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[18];
            parameters[0] = this.m_HotHoldingLog.HotHoldingLogId;
            parameters[1] = this.m_HotHoldingLog.EntryDate;
            parameters[2] = this.m_HotHoldingLog.FoodItem;
            parameters[3] = this.m_HotHoldingLog.IsCustomItem;
            parameters[4] = this.m_HotHoldingLog.InternalTemp1;
            parameters[5] = this.m_HotHoldingLog.Temp1Time;
            parameters[6] = this.m_HotHoldingLog.InternalTemp2;
            parameters[7] = this.m_HotHoldingLog.Temp2Time;
            //parameters[8] = this.m_HotHoldingLog.CorrectiveAction;
            parameters[8] = this.m_HotHoldingLog.UserName;
            parameters[9] = this.m_HotHoldingLog.VerifiedBy;
            parameters[10] = this.m_HotHoldingLog.VerifiedDate;
            parameters[11] = this.m_HotHoldingLog.KitchenId;
            parameters[12] = this.m_HotHoldingLog.MealDate;
            parameters[13] = this.m_HotHoldingLog.IngredientId;
            parameters[14] = this.m_HotHoldingLog.MenuItemId;
            parameters[15] = this.m_HotHoldingLog.CorrectiveAction1;
            parameters[16] = this.m_HotHoldingLog.CorrectiveAction2;
            parameters[17] = this.m_HotHoldingLog.MobileId;
            Parameters = parameters;
		}

		public HotHoldingLog  HotHoldingLog 
		{
			get { return m_HotHoldingLog ; }
			set { m_HotHoldingLog  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
