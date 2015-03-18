using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteMealServingCalendar : IBusinessLogic
    {
        private MealServingCalendar m_MealServingCalendar;

        public ProcessDeleteMealServingCalendar()
        {
        }

        public void Invoke()
        {
            DeleteMealServingCalendar deleteMealServingCalendar = new DeleteMealServingCalendar();
            deleteMealServingCalendar.MealServingCalendar = this.m_MealServingCalendar;
            deleteMealServingCalendar.Delete();
        }
        public void DeleteMealServingCalendarByKitchenId()
        {
            DeleteMealServingCalendar deleteMealServingCalendar = new DeleteMealServingCalendar();
            deleteMealServingCalendar.MealServingCalendar = this.m_MealServingCalendar;
            deleteMealServingCalendar.DeleteMealServingCalendarByKitchenId();
        }

        public MealServingCalendar MealServingCalendar
        {
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
        }
    }
}

