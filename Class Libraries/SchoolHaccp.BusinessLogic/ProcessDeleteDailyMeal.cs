using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteDailyMeal : IBusinessLogic
    {
        private DailyMeal m_DailyMeal;

        public ProcessDeleteDailyMeal()
        {
        }

        public void Invoke()
        {
            DeleteDailyMeal deleteDailyMeal = new DeleteDailyMeal();
            deleteDailyMeal.DailyMeal = this.m_DailyMeal;
            deleteDailyMeal.Delete();
        }
       

        public DailyMeal DailyMeal
        {
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
        }
    }
}

