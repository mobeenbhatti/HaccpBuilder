using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class Lunch
    {
        private int m_LunchId;
        private int m_MealCalendarId;
        private int m_MenuItemId;


        public Lunch()
        {
        }

        public int MenuItemId
        {
            get { return m_MenuItemId; }
            set { m_MenuItemId = value; }
        }

        public int LunchId
        {
            get { return m_LunchId; }
            set { m_LunchId = value; }
        }
        public int MealCalendarId
        {
            get { return m_MealCalendarId; }
            set { m_MealCalendarId = value; }
        }

    }
}



