using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
	public class SetMealServingCalendar : DataAccessBase
	{
        private MealServingCalendar m_MealServingCalendar;

		public SetMealServingCalendar()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateMealServingCalendar.ToString();
		}

		public void Update()
		{
			SetMealServingCalendarByIdDataParameters setParameters = new SetMealServingCalendarByIdDataParameters(this.m_MealServingCalendar);
			DataServices dataServices = new DataServices(base.StoredProcedureName);
            //dataServices.ExecuteNonQuery(setParameters.Parameters);
            dataServices.ExecuteScalar(setParameters.Parameters);
		}
        //public void UpdateEvent(int nMealCalendarId, int nEventId)
        //{
        //    object[] parameters = new object[2];
        //    parameters[0] = nMealCalendarId;
        //    parameters[1] = nEventId;
        //    DataServices dataServices = new DataServices("uspAdm_UpdateMealServingEvent");
        //    dataServices.ExecuteScalar(parameters);
        //}
        public void UpdateEvent(int nMealCalendarId, int nEventId, int nSelected)
        {
            object[] parameters = new object[3];
            parameters[0] = nMealCalendarId;
            parameters[1] = nEventId;
            parameters[2] = nSelected;
            DataServices dataServices = new DataServices("uspAdm_UpdateMealServingEvent");
            dataServices.ExecuteScalar(parameters);
        }

        public MealServingCalendar MealServingCalendar 
		{
			get { return m_MealServingCalendar ; }
			set { m_MealServingCalendar  = value; }
		}
	}

	public class SetMealServingCalendarByIdDataParameters
	{
        private MealServingCalendar m_MealServingCalendar;
		object[] m_Parameters;

        public SetMealServingCalendarByIdDataParameters(MealServingCalendar MealServingCalendar)
		{
			this.m_MealServingCalendar  = MealServingCalendar ;
			Build();
		}

		private void Build()
		{
           
            object[] parameters = new object[3];
            parameters[0] = this.m_MealServingCalendar.MealCalendarId;           
            parameters[1] = this.m_MealServingCalendar.BreakFast;
            parameters[2] = this.m_MealServingCalendar.Lunch;
            Parameters = parameters;
		}

        public MealServingCalendar MealServingCalendar 
		{
			get { return m_MealServingCalendar ; }
			set { m_MealServingCalendar  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
