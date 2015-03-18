using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteMealServingCalendar : DataAccessBase
	{
        private MealServingCalendar m_MealServingCalendar;

		public DeleteMealServingCalendar()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteMealServingCalendar.ToString();
		}

		public void Delete()
		{
            DeleteMealServingCalendarDataParameters createParameters = new DeleteMealServingCalendarDataParameters(this.m_MealServingCalendar);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}
        public void DeleteMealServingCalendarByKitchenId()
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_MealServingCalendar.KitchenId; 
            DataServices dataServices = new DataServices("uspAdm_DeleteMealServingCalendarByKitchenId");
            object returnValue = dataServices.ExecuteScalar(parameters);
        }

        public MealServingCalendar MealServingCalendar
		{
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
		}
	}

	public class DeleteMealServingCalendarDataParameters
	{
		private MealServingCalendar m_MealServingCalendar;
		object[] m_Parameters;

        public DeleteMealServingCalendarDataParameters(MealServingCalendar MealServingCalendar)
		{
            this.m_MealServingCalendar = MealServingCalendar;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_MealServingCalendar.MealCalendarId;           
            Parameters = parameters;
		}

        public MealServingCalendar MealServingCalendar
		{
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
