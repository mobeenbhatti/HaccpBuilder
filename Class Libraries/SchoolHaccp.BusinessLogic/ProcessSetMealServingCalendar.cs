using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetMealServingCalendar : IBusinessLogic
    {
        private MealServingCalendar m_MealServingCalendar;

        public ProcessSetMealServingCalendar()
        {
        }

        public void Invoke()
        {
            SetMealServingCalendar setMeal = new SetMealServingCalendar();
            setMeal.MealServingCalendar = this.m_MealServingCalendar;
            setMeal.Update();
        }
        public void SetMealServingEvent(int nMealCalendarId, int nEventId, int nSelected)
        {
            SetMealServingCalendar setMeal = new SetMealServingCalendar();
            setMeal.UpdateEvent(nMealCalendarId, nEventId, nSelected);
        }

        public MealServingCalendar MealServingCalendar
        {
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
        }
    }
}
