using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
  public  class GetPhLog : DataAccessBase
    {
        private PhLog m_PhLog;

        public GetPhLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetPhLog.ToString();
		}

		public DataSet GetPhLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();
            
            try
            {
                 tempData = dataServices.ExecuteDataSet("uspAdm_GetPhLogByKitchenId", parameters);
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
        public DataSet GetPhLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetPhLogByMobileId", parameters);
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
        public DataSet GetPhLogKitchenInventory(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetPhLogInventoryByKitchenID", parameters);
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
        public DataSet GetPhLogSentizers(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetPhSenitizersByKitchenID", parameters);
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

        public IDataReader GetPhLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetPhLogByDate", parameters);
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
            GetPhLogDataParameters getParameters = new GetPhLogDataParameters(this.m_PhLog);
            DataServices dataServices = new DataServices("uspAdm_GetPhLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }
    }

    public class GetPhLogDataParameters
    {
        private PhLog m_PhLog;
        object[] m_Parameters;

        public GetPhLogDataParameters(PhLog PhLog)
        {
            this.m_PhLog = PhLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = PhLog.PhLogId;
            Parameters = parameters;
        }

        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
		
	}
}
