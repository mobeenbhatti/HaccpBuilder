using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetTemperatureLog : DataAccessBase
	{
        private TemperatureLog m_TemperatureLog;

        public GetTemperatureLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetTemperatureLog.ToString();
		}

		public DataSet GetTemperatureLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetTemperatureLogByKitchenId", parameters);
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
        public DataSet GetTemperatureLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1]=nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetTemperatureLogByMobileId", parameters);
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
        public IDataReader GetTemperatureLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetTemperatureLogByDate", parameters);
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
            GetTemperatureLogDataParameters getParameters = new GetTemperatureLogDataParameters(this.m_TemperatureLog);
            DataServices dataServices = new DataServices("uspAdm_GetTemperatureLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }
        public IDataReader GetCriticalLimits(int nIngredientId)
        {
            object[] parameters = new object[1];
            parameters[0] = nIngredientId;
            DataServices dataServices = new DataServices("uspAdm_GetCriticalLimitsByIngredientId");
            return dataServices.ExecuteReader(parameters);
        }
        public DataSet GetCorrectiveActions(int nIngredientId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nIngredientId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetCorrectiveActionByIngredientId", parameters);
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

        public TemperatureLog TemperatureLog
        {
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
        }
    }

    public class GetTemperatureLogDataParameters
    {
        private TemperatureLog m_TemperatureLog;
        object[] m_Parameters;

        public GetTemperatureLogDataParameters(TemperatureLog TemperatureLog)
        {
            this.m_TemperatureLog = TemperatureLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = TemperatureLog.TemperatureLogId;
            Parameters = parameters;
        }

        public TemperatureLog TemperatureLog
        {
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
