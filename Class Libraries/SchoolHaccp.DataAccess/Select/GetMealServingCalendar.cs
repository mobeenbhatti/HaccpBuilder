using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetMealServingCalendar : DataAccessBase
	{
        private MealServingCalendar m_MealServingCalendar;

        public GetMealServingCalendar()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetMealServingCalendar.ToString();
		}

		public DataSet GetMealServingCalendarDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
                if (tempData== null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return tempData;
        }

        public DataSet GetSelectedMealServingCalendar(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetSelectedMealServingCalendar", parameters);
                if (tempData== null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return tempData;
        }
        public IDataReader GetMealServingCalendarByKitchenId(int  nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader(base.StoredProcedureName, parameters);
                if (tempData == null)
                {
                    throw new Exception("Failed to retrieve data.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return tempData;
        }        

        public MealServingCalendar MealServingCalendar
        {
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
        }
    }

    public class GetMealServingCalendarDataParameters
    {
        private MealServingCalendar m_MealServingCalendar;
        object[] m_Parameters;

        public GetMealServingCalendarDataParameters(MealServingCalendar MealServingCalendar)
        {
            this.m_MealServingCalendar = MealServingCalendar;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = MealServingCalendar.MealCalendarId;
            Parameters = parameters;
        }

        public MealServingCalendar MealServingCalendar
        {
            get { return m_MealServingCalendar; }
            set { m_MealServingCalendar = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
