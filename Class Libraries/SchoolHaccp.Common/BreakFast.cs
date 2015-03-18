using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class BreakFast
    {
        private int m_BreakFastId;        
       private int m_MealCalendarId;
       private int m_MenuItemId;
      

        public BreakFast()
        {
        }

        public int MenuItemId
        {
            get { return m_MenuItemId; }
            set { m_MenuItemId = value; }
        }

        public int BreakFastId
       {
           get { return m_BreakFastId; }
           set { m_BreakFastId = value; }
       }
        public int MealCalendarId
       {
           get { return m_MealCalendarId; }
           set { m_MealCalendarId = value; }
       }
        
    }
}



