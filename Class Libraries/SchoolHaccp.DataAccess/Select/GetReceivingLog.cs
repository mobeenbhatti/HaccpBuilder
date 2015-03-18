using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetReceivingLog : DataAccessBase
    {
        private ReceivingLog m_ReceivingLog;

        public GetReceivingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetReceivingLog.ToString();
        }

        public DataSet GetReceivingLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetReceivingLogByKitchenId", parameters);
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
        public DataSet GetReceivingLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetReceivingLogByMobileId", parameters);
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
        public IDataReader GetReceivingLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetReceivingLogByDate", parameters);
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
            GetReceivingLogDataParameters getParameters = new GetReceivingLogDataParameters(this.m_ReceivingLog);
            DataServices dataServices = new DataServices("uspAdm_GetReceivingLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }

    public class GetReceivingLogDataParameters
    {
        private ReceivingLog m_ReceivingLog;
        object[] m_Parameters;

        public GetReceivingLogDataParameters(ReceivingLog ReceivingLog)
        {
            this.m_ReceivingLog = ReceivingLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = ReceivingLog.ReceivingLogId;
            Parameters = parameters;
        }

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }


}
