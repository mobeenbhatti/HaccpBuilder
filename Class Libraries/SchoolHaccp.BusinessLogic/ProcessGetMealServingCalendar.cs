using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetMealServingCalendar : IBusinessLogic
    {
        private DataSet m_ResultSet;
        private MealServingCalendar m_MealServingCalendar;

        public ProcessGetMealServingCalendar()
        {
        }

        public void Invoke()
        {
            GetMealServingCalendar getMealServingCalendar = new GetMealServingCalendar();
            getMealServingCalendar.MealServingCalendar = this.MealServingCalendar;
            
        }

        public DataSet ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }

        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMealServingCalendarByKitchenId(int nKitchenId)
        {
            GetMealServingCalendar getMealServingCalendar = new GetMealServingCalendar();
            return getMealServingCalendar.GetMealServingCalendarDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethod(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedMealServingCalendar(int nKitchenId)
        {
            GetMealServingCalendar getMealServingCalendar = new GetMealServingCalendar();
            return getMealServingCalendar.GetSelectedMealServingCalendar(nKitchenId);
        }
        


        public MealServingCalendar MealServingCalendar
        {
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
        }
    }
}
