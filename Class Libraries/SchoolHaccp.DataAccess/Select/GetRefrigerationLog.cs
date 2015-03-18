using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetRefrigerationLog : DataAccessBase
    {
        private RefrigerationLog m_RefrigerationLog;

        public GetRefrigerationLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetRefrigerationLog.ToString();
        }

        public DataSet GetRefrigerationLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetRefrigerationLogByKitchenId", parameters);
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
        public DataSet GetRefrigerationLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetRefrigerationLogByMobileId", parameters);
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
        public DataSet GetRefrigerationCustomInventoriesDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {

                tempData = dataServices.ExecuteDataSet("uspAdm_GetRefrigerationInventoryByKitchenID", parameters);
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
        public IDataReader GetRefrigerationLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetRefrigerationLogByDate", parameters);
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
            GetRefrigerationLogDataParameters getParameters = new GetRefrigerationLogDataParameters(this.m_RefrigerationLog);
            DataServices dataServices = new DataServices("uspAdm_GetRefrigerationLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }

    public class GetRefrigerationLogDataParameters
    {
        private RefrigerationLog m_RefrigerationLog;
        object[] m_Parameters;

        public GetRefrigerationLogDataParameters(RefrigerationLog RefrigerationLog)
        {
            this.m_RefrigerationLog = RefrigerationLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = RefrigerationLog.RefrigerationLogId;
            Parameters = parameters;
        }

        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }


}
