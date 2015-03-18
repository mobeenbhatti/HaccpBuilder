using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateDailyMeal : IBusinessLogic
    {
        private DailyMeal m_DailyMeal;

        public ProcessCreateDailyMeal()
        {
        }

        public void Invoke()
        {
            CreateDailyMeal createDailyMeal = new CreateDailyMeal();
            createDailyMeal.DailyMeal = this.DailyMeal;
            createDailyMeal.Insert();
            this.DailyMeal = createDailyMeal.DailyMeal;
        }

        public DailyMeal DailyMeal
        {
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
        }
    }
}
