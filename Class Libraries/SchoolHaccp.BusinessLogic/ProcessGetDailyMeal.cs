using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetDailyMeal : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private DailyMeal m_DailyMeal;

        public ProcessGetDailyMeal()
        {
        }

        public void Invoke()
        {
            GetDailyMeal getDailyMeal = new GetDailyMeal();
            getDailyMeal.DailyMeal = this.DailyMeal;

        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetDailyMealByKitchenId(int nMealCalendarId, int nEventId,int nKitchenId)
        {
            GetDailyMeal getDailyMeal = new GetDailyMeal();
            //this.DailyMeal.MealCalendarId = nMealCalendarId;
            //this.DailyMeal.EventId = nEventId;
            //getDailyMeal.DailyMeal = this.DailyMeal;
            return getDailyMeal.GetDailyMealDataSet(nMealCalendarId, nEventId,nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetDailySelectedMeal(int nMealCalendarId, int nEventId, int nKitchenId)
        {
            GetDailyMeal getDailyMeal = new GetDailyMeal();            
            return getDailyMeal.GetDailySelectedMeal(nMealCalendarId, nEventId, nKitchenId);
        }
        



        public DailyMeal DailyMeal
        {
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
        }
    }
}
