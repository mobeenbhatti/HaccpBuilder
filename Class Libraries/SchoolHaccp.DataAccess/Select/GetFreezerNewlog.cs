using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetFreezerNewLog : DataAccessBase
    {
        private FreezerNewLog m_FreezerNewLog;

        public GetFreezerNewLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetFreezerNewLog.ToString();
        }

        public DataSet GetFreezerNewLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetFreezerNewLogByKitchenId", parameters);
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
        public DataSet GetFreezerNewLogDataSetByMobileId(int nKitchenId, int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetFreezerNewLogByMobileId", parameters);
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
        public DataSet GetFreezerNewLogCustomInventoriesDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {

                tempData = dataServices.ExecuteDataSet("uspAdm_GetFreezerInventoryByKitchenID", parameters);
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
        public IDataReader GetFreezerNewLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetFreezerNewLogByDate", parameters);
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
            GetFreezerNewLogDataParameters getParameters = new GetFreezerNewLogDataParameters(this.m_FreezerNewLog);
            DataServices dataServices = new DataServices("uspAdm_GetFreezerNewLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }

    public class GetFreezerNewLogDataParameters
    {
        private FreezerNewLog m_FreezerNewLog;
        object[] m_Parameters;

        public GetFreezerNewLogDataParameters(FreezerNewLog FreezerNewLog)
        {
            this.m_FreezerNewLog = FreezerNewLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = FreezerNewLog.FreezerNewLogId;
            Parameters = parameters;
        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }


}

