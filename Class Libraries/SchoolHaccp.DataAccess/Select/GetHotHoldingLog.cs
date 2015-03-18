using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetHotHoldingLog : DataAccessBase
	{
        private HotHoldingLog m_HotHoldingLog;

        public GetHotHoldingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetHotHoldingLog.ToString();
		}

		public DataSet GetHotHoldingLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetHotHoldingLogByKitchenId", parameters);
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
        public DataSet GetHotHoldingLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetHotHoldingLogByMobileId", parameters);
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
        public IDataReader GetHotHoldingLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetHotHoldingLogByDate", parameters);
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
            GetHotHoldingLogDataParameters getParameters = new GetHotHoldingLogDataParameters(this.m_HotHoldingLog);
            DataServices dataServices = new DataServices("uspAdm_GetHotHoldingLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public HotHoldingLog HotHoldingLog
        {
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
        }
    }

    public class GetHotHoldingLogDataParameters
    {
        private HotHoldingLog m_HotHoldingLog;
        object[] m_Parameters;

        public GetHotHoldingLogDataParameters(HotHoldingLog HotHoldingLog)
        {
            this.m_HotHoldingLog = HotHoldingLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = HotHoldingLog.HotHoldingLogId;
            Parameters = parameters;
        }

        public HotHoldingLog HotHoldingLog
        {
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
