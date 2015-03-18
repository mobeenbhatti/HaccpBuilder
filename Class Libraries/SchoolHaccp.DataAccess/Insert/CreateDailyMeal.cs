using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateDailyMeal : DataAccessBase
	{
        private DailyMeal m_DailyMeal;

		public CreateDailyMeal()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertDailyMeal.ToString();
		}

		public void Insert()
		{
            int DailyMealId = 0;
            CreateDailyMealDataParameters createParameters = new CreateDailyMealDataParameters(this.m_DailyMeal);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public DailyMeal DailyMeal
		{
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
		}
	}

	public class CreateDailyMealDataParameters
	{
		private DailyMeal m_DailyMeal;
		object[] m_Parameters;

        public CreateDailyMealDataParameters(DailyMeal DailyMeal)
		{
            this.m_DailyMeal = DailyMeal;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[3];
            parameters[0] = this.m_DailyMeal.MealCalendarId;
            parameters[1] = this.m_DailyMeal.MenuItemId;
            parameters[2] = this.DailyMeal.EventId;
    

            Parameters = parameters;
		}

        public DailyMeal DailyMeal
		{
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
