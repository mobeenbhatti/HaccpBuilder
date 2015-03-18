using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetTemperatureLog : DataAccessBase
	{
		private TemperatureLog  m_TemperatureLog ;

		public SetTemperatureLog()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateTemperatureLog.ToString();
		}

		public void Update()
		{
			SetTemperatureLogByIdDataParameters setParameters = new SetTemperatureLogByIdDataParameters(this.m_TemperatureLog );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public TemperatureLog  TemperatureLog 
		{
			get { return m_TemperatureLog ; }
			set { m_TemperatureLog  = value; }
		}
	}

	public class SetTemperatureLogByIdDataParameters
	{
		private TemperatureLog  m_TemperatureLog ;
		object[] m_Parameters;

		public SetTemperatureLogByIdDataParameters(TemperatureLog  TemperatureLog )
		{
			this.m_TemperatureLog  = TemperatureLog ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[20];
            parameters[0] = this.m_TemperatureLog.TemperatureLogId;
            parameters[1] = this.m_TemperatureLog.EntryDate;
            parameters[2] = this.m_TemperatureLog.FoodItem;
            parameters[3] = this.m_TemperatureLog.IsCustomItem;
            parameters[4] = this.m_TemperatureLog.InternalTemp1;
            parameters[5] = this.m_TemperatureLog.Temp1Time;
            parameters[6] = this.m_TemperatureLog.InternalTemp2;
            parameters[7] = this.m_TemperatureLog.Temp2Time;
            parameters[8] = this.m_TemperatureLog.CorrectiveAction;
            parameters[9] = this.m_TemperatureLog.UserName;
            parameters[10] = this.m_TemperatureLog.VerifiedBy;
            parameters[11] = this.m_TemperatureLog.VerifiedDate;
            parameters[12] = this.m_TemperatureLog.KitchenId;
            parameters[13] = this.m_TemperatureLog.MealDate;
            parameters[14] = this.m_TemperatureLog.IngredientId;
            parameters[15] = this.m_TemperatureLog.MenuItemId;
            parameters[16] = this.m_TemperatureLog.CorrectiveAction1;
            parameters[17] = this.m_TemperatureLog.CorrectiveAction2;
            parameters[18] = this.m_TemperatureLog.MobileId;
            parameters[19] = this.m_TemperatureLog.BatchNo;
            Parameters = parameters;
		}

		public TemperatureLog  TemperatureLog 
		{
			get { return m_TemperatureLog ; }
			set { m_TemperatureLog  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
