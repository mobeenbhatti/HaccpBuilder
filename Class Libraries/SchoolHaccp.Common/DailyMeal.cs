using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class DailyMeal
    {
        private int m_DailyMealId;        
       private int m_MealCalendarId;
       private int m_MenuItemId;
       private int m_EventId;
      

        public DailyMeal()
        {
        }

        public int MenuItemId
        {
            get { return m_MenuItemId; }
            set { m_MenuItemId = value; }
        }

        public int DailyMealId
       {
           get { return m_DailyMealId; }
           set { m_DailyMealId = value; }
       }
        public int MealCalendarId
       {
           get { return m_MealCalendarId; }
           set { m_MealCalendarId = value; }
       }
       public int EventId
        {
            get { return m_EventId; }
            set { m_EventId = value; }
        }

        
    }
}



