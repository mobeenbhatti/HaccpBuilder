using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetDailyMeal : DataAccessBase
    {
        private DailyMeal m_DailyMeal;

        public GetDailyMeal()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetDailyMeal.ToString();
        }

        public DataSet GetDailyMealDataSet(int nMealCalendarId, int nEventId, int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[3];
            parameters[0] = nMealCalendarId;
            parameters[1] = nEventId;
            parameters[2] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet(base.StoredProcedureName, parameters);
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

        public DataSet GetDailySelectedMeal(int nMealCalendarId, int nEventId, int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[3];
            parameters[0] = nMealCalendarId;
            parameters[1] = nEventId;
            parameters[2] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetDailySelectedMeal", parameters);
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
        public IDataReader Get()
        {
            GetDailyMealDataParameters getParameters = new GetDailyMealDataParameters(this.m_DailyMeal);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            return dataServices.ExecuteReader(getParameters.Parameters);
        }
        public DailyMeal DailyMeal
        {
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
        }
    }

    public class GetDailyMealDataParameters
    {
        private DailyMeal m_DailyMeal;
        object[] m_Parameters;

        public GetDailyMealDataParameters(DailyMeal DailyMeal)
        {
            this.m_DailyMeal = DailyMeal;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = DailyMeal.MealCalendarId;
            parameters[1] = DailyMeal.EventId;
            Parameters = parameters;
        }

        public DailyMeal DailyMeal
        {
            get { return m_DailyMeal; }
            set { m_DailyMeal = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }


}
