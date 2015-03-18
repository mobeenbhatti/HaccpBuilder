using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetColdHoldingLog : DataAccessBase
	{
		private ColdHoldingLog  m_ColdHoldingLog ;

		public SetColdHoldingLog()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateColdHoldingLog.ToString();
		}

		public void Update()
		{
			SetColdHoldingLogByIdDataParameters setParameters = new SetColdHoldingLogByIdDataParameters(this.m_ColdHoldingLog );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public ColdHoldingLog  ColdHoldingLog 
		{
			get { return m_ColdHoldingLog ; }
			set { m_ColdHoldingLog  = value; }
		}
	}

	public class SetColdHoldingLogByIdDataParameters
	{
		private ColdHoldingLog  m_ColdHoldingLog ;
		object[] m_Parameters;

		public SetColdHoldingLogByIdDataParameters(ColdHoldingLog  ColdHoldingLog )
		{
			this.m_ColdHoldingLog  = ColdHoldingLog ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[18];
            parameters[0] = this.m_ColdHoldingLog.ColdHoldingLogId;
            parameters[1] = this.m_ColdHoldingLog.EntryDate;
            parameters[2] = this.m_ColdHoldingLog.FoodItem;
            parameters[3] = this.m_ColdHoldingLog.IsCustomItem;
            parameters[4] = this.m_ColdHoldingLog.InternalTemp1;
            parameters[5] = this.m_ColdHoldingLog.Temp1Time;
            parameters[6] = this.m_ColdHoldingLog.InternalTemp2;
            parameters[7] = this.m_ColdHoldingLog.Temp2Time;
            //parameters[8] = this.m_ColdHoldingLog.CorrectiveAction;
            parameters[8] = this.m_ColdHoldingLog.UserName;
            parameters[9] = this.m_ColdHoldingLog.VerifiedBy;
            parameters[10] = this.m_ColdHoldingLog.VerifiedDate;
            parameters[11] = this.m_ColdHoldingLog.KitchenId;
            parameters[12] = this.m_ColdHoldingLog.MealDate;
            parameters[13] = this.m_ColdHoldingLog.IngredientId;
            parameters[14] = this.m_ColdHoldingLog.MenuItemId;
            parameters[15] = this.m_ColdHoldingLog.CorrectiveAction1;
            parameters[16] = this.m_ColdHoldingLog.CorrectiveAction2;
            parameters[17] = this.m_ColdHoldingLog.MobileId;
            Parameters = parameters;
		}

		public ColdHoldingLog  ColdHoldingLog 
		{
			get { return m_ColdHoldingLog ; }
			set { m_ColdHoldingLog  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
