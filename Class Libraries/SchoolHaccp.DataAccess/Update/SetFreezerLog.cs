using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetFreezerLog : DataAccessBase
	{
		private FreezerLog  m_FreezerLog ;

		public SetFreezerLog()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateFreezerLog.ToString();
		}

		public void Update()
		{
			SetFreezerLogByIdDataParameters setParameters = new SetFreezerLogByIdDataParameters(this.m_FreezerLog );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public FreezerLog  FreezerLog 
		{
			get { return m_FreezerLog ; }
			set { m_FreezerLog  = value; }
		}
	}

	public class SetFreezerLogByIdDataParameters
	{
		private FreezerLog  m_FreezerLog ;
		object[] m_Parameters;

		public SetFreezerLogByIdDataParameters(FreezerLog  FreezerLog )
		{
			this.m_FreezerLog  = FreezerLog ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[21];
            parameters[0] = this.m_FreezerLog.FreezerLogId;
            parameters[1] = this.m_FreezerLog.EntryDate;
            parameters[2] = this.m_FreezerLog.FoodItem;
            parameters[3] = this.m_FreezerLog.IsCustomItem;
            parameters[4] = this.m_FreezerLog.Temp1;
            parameters[5] = this.m_FreezerLog.Temp1Time;
            parameters[6] = this.m_FreezerLog.Temp2;
            parameters[7] = this.m_FreezerLog.Temp2Time;
            parameters[8] = this.m_FreezerLog.Temp3;
            parameters[9] = this.m_FreezerLog.Temp3Time;
            //parameters[10] = this.m_FreezerLog.Temp4;
            //parameters[11] = this.m_FreezerLog.Temp4Time;
            //parameters[12] = this.m_FreezerLog.Temp5;
            //parameters[13] = this.m_FreezerLog.Temp5Time;
            //parameters[14] = this.m_FreezerLog.Temp6;
            //parameters[15] = this.m_FreezerLog.Temp6Time;
            //parameters[16] = this.m_FreezerLog.CorrectiveAction;
            parameters[10] = this.m_FreezerLog.UserName;
            parameters[11] = this.m_FreezerLog.VerifiedBy;
            parameters[12] = this.m_FreezerLog.VerifiedDate;
            parameters[13] = this.m_FreezerLog.KitchenId;
            parameters[14] = this.m_FreezerLog.MealDate;
            parameters[15] = this.m_FreezerLog.IngredientId;
            parameters[16] = this.m_FreezerLog.MenuItemId;
            parameters[17] = this.m_FreezerLog.CorrectiveAction1;
            parameters[18] = this.m_FreezerLog.CorrectiveAction2;
            parameters[19] = this.m_FreezerLog.CorrectiveAction3;
            parameters[20] = this.m_FreezerLog.MobileId;
              Parameters = parameters;
		}

		public FreezerLog  FreezerLog 
		{
			get { return m_FreezerLog ; }
			set { m_FreezerLog  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
