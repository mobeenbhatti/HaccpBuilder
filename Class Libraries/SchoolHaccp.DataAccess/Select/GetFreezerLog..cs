using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
	public class GetFreezerLog : DataAccessBase
	{
        private FreezerLog m_FreezerLog;

        public GetFreezerLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetFreezerLog.ToString();
		}

		public DataSet GetFreezerLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetFreezerLogByKitchenId", parameters);
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
        public DataSet GetFreezerLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetFreezerLogByMobileId", parameters);
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
        public IDataReader GetFreezerLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetFreezerLogByDate", parameters);
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
            GetFreezerLogDataParameters getParameters = new GetFreezerLogDataParameters(this.m_FreezerLog);
            DataServices dataServices = new DataServices("uspAdm_GetFreezerLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public FreezerLog FreezerLog
        {
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
        }
    }

    public class GetFreezerLogDataParameters
    {
        private FreezerLog m_FreezerLog;
        object[] m_Parameters;

        public GetFreezerLogDataParameters(FreezerLog FreezerLog)
        {
            this.m_FreezerLog = FreezerLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = FreezerLog.FreezerLogId;
            Parameters = parameters;
        }

        public FreezerLog FreezerLog
        {
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}

	
}
