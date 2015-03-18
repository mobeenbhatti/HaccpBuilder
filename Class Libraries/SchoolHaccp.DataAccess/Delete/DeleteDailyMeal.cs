using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteDailyMeal : DataAccessBase
	{
        private DailyMeal m_DailyMeal;

		public DeleteDailyMeal()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteDailyMeal.ToString();
		}

		public void Delete()
		{
            DeleteDailyMealDataParameters createParameters = new DeleteDailyMealDataParameters(this.m_DailyMeal);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}
        

        public DailyMeal DailyMeal
		{
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
		}
	}

	public class DeleteDailyMealDataParameters
	{
		private DailyMeal m_DailyMeal;
		object[] m_Parameters;

        public DeleteDailyMealDataParameters(DailyMeal DailyMeal)
		{
            this.m_DailyMeal = DailyMeal;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.m_DailyMeal.MealCalendarId;
            parameters[1] = this.m_DailyMeal.EventId;
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
