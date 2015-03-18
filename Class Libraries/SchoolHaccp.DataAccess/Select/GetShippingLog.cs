using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetShippingLog : DataAccessBase
    {
        private ShippingLog m_ShippingLog;

        public GetShippingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetShippingLog.ToString();
        }

        public DataSet GetShippingLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetShippingLogByKitchenId", parameters);
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
        public DataSet GetShippingLogDataSetByMobileId(int nKitchenId, int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetShippingLogByMobileId", parameters);
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
        public IDataReader GetShippingLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetShippingLogByDate", parameters);
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
            GetShippingLogDataParameters getParameters = new GetShippingLogDataParameters(this.m_ShippingLog);
            DataServices dataServices = new DataServices("uspAdm_GetShippingLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }

    public class GetShippingLogDataParameters
    {
        private ShippingLog m_ShippingLog;
        object[] m_Parameters;

        public GetShippingLogDataParameters(ShippingLog ShippingLog)
        {
            this.m_ShippingLog = ShippingLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = ShippingLog.ShippingLogId;
            Parameters = parameters;
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }


}

