using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateMealServingCalendar : DataAccessBase
	{
        private MealServingCalendar m_MealServingCalendar;

        public CreateMealServingCalendar()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertMealServingCalendar.ToString();
		}

		public void Insert()
		{
            
            CreateMealServingCalendarDataParameters createParameters = new CreateMealServingCalendarDataParameters(this.m_MealServingCalendar);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public MealServingCalendar MealServingCalendar
		{
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
		}
	}

	public class CreateMealServingCalendarDataParameters
	{
		private MealServingCalendar m_MealServingCalendar;
		object[] m_Parameters;

        public CreateMealServingCalendarDataParameters(MealServingCalendar mealServingCalendar)
		{
            this.m_MealServingCalendar = mealServingCalendar;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.m_MealServingCalendar.KitchenId;
            parameters[1] = this.m_MealServingCalendar.MealDate;                    

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
