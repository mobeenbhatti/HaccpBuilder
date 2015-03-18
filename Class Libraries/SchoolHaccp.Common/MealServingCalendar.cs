using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class MealServingCalendar
    {
       private int m_MealCalendarId;
        private int m_KitchenId;       
        private DateTime m_MealDate ;
        private int m_BreakFast;
        private int m_Lunch;
	

    public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
    public int MealCalendarId
        {
            get { return m_MealCalendarId; }
            set { m_MealCalendarId = value; }
        }
   
    
   public DateTime MealDate
        {
            get { return m_MealDate; }
            set { m_MealDate = value; }
        }
   public int BreakFast
   {
       get { return m_BreakFast; }
       set { m_BreakFast = value; }
   }
   public int Lunch
   {
       get { return m_Lunch; }
       set { m_Lunch = value; }
   }
    }
}
