using System;
using System.Data;
using System.Globalization;
using System.Collections.Generic;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetThermoCalibrationLog : DataAccessBase
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public GetThermoCalibrationLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetThermoCalibrationLog.ToString();
        }

        public DataSet GetThermoCalibrationLogDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetThermoCalibrationLogByKitchenId", parameters);
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
        public DataSet GetThermoCalibrationLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            DataSet tempData;
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = nMobileId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteDataSet("uspAdm_GetThermoCalibrationLogByMobileId", parameters);
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
        public IDataReader GetThermoCalibrationLogByDate(DateTime dtEntryDate, int nKitchenId)
        {
            IDataReader tempData;
            object[] parameters = new object[2];
            parameters[0] = dtEntryDate;
            parameters[1]= nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {
                tempData = dataServices.ExecuteReader("uspAdm_GetThermoCalibrationLogByDate", parameters);
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
        public DataSet GetThermometersDataSet(int nKitchenId)
        {
            DataSet tempData;
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            DataServices dataServices = new DataServices();

            try
            {

                tempData = dataServices.ExecuteDataSet("uspAdm_GetThermometerDeviceByKitchenID", parameters);
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
            GetThermoCalibrationLogDataParameters getParameters = new GetThermoCalibrationLogDataParameters(this.m_ThermoCalibrationLog);
            DataServices dataServices = new DataServices("uspAdm_GetThermoCalibrationLog");
            return dataServices.ExecuteReader(getParameters.Parameters);
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }

    public class GetThermoCalibrationLogDataParameters
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;
        object[] m_Parameters;

        public GetThermoCalibrationLogDataParameters(ThermoCalibrationLog ThermoCalibrationLog)
        {
            this.m_ThermoCalibrationLog = ThermoCalibrationLog;
            Build();
        }
        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = ThermoCalibrationLog.ThermoCalibrationLogId;
            Parameters = parameters;
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }

    }


}
