using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateMealServingCalendar : IBusinessLogic
    {
        private MealServingCalendar m_MealServingCalendar;

        public ProcessCreateMealServingCalendar()
        {
        }

        public void Invoke()
        {
            CreateMealServingCalendar createMealServingCalendar = new CreateMealServingCalendar();
            createMealServingCalendar.MealServingCalendar = this.MealServingCalendar;
            createMealServingCalendar.Insert();
            this.MealServingCalendar = createMealServingCalendar.MealServingCalendar;
        }

        public MealServingCalendar MealServingCalendar
        {
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
        }
    }
}
