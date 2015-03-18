using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetColdHoldingLog : DataAccessBase
	{
        private ColdHoldingLog m_ColdHoldingLog;

        public GetColdHoldingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetColdHoldingLog.ToString();
		}

		public DataSet GetColdHoldingLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetColdHoldingLogByKitchenId", parameters);
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
        public DataSet GetColdHoldingLogDataSetByMobileId(int nKitchenId, int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetColdHoldingLogByMobileId", parameters);
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
        public IDataReader GetColdHoldingLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetColdHoldingLogByDate", parameters);
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
            GetColdHoldingLogDataParameters getParameters = new GetColdHoldingLogDataParameters(this.m_ColdHoldingLog);
            DataServices dataServices = new DataServices("uspAdm_GetColdHoldingLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public ColdHoldingLog ColdHoldingLog
        {
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
        }
    }

    public class GetColdHoldingLogDataParameters
    {
        private ColdHoldingLog m_ColdHoldingLog;
        object[] m_Parameters;

        public GetColdHoldingLogDataParameters(ColdHoldingLog ColdHoldingLog)
        {
            this.m_ColdHoldingLog = ColdHoldingLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = ColdHoldingLog.ColdHoldingLogId;
            Parameters = parameters;
        }

        public ColdHoldingLog ColdHoldingLog
        {
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
