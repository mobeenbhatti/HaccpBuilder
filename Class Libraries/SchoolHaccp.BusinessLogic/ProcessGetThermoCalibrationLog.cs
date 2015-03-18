using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetThermoCalibrationLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public ProcessGetThermoCalibrationLog()
        {
        }

        public void Invoke()
        {
            GetThermoCalibrationLog getThermoCalibrationLog = new GetThermoCalibrationLog();
            getThermoCalibrationLog.ThermoCalibrationLog = this.ThermoCalibrationLog;
            this.ResultSet = getThermoCalibrationLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetThermoCalibrationLogByKitchenId(int nKitchenId)
        {
            GetThermoCalibrationLog getLog = new GetThermoCalibrationLog();
            return getLog.GetThermoCalibrationLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetThermoCalibrationLogByMobileId(int nKitchenId,int nMobileId)
        {
            GetThermoCalibrationLog getLog = new GetThermoCalibrationLog();
            return getLog.GetThermoCalibrationLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetThermoCalibrationLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetThermoCalibrationLog getLog = new GetThermoCalibrationLog();
            return getLog.GetThermoCalibrationLogByDate(dtEntryDate, nKitchenId);
        }
        public DataSet GetThermometersByKitchenId(int nKitchenId)
        {
            GetThermoCalibrationLog getLog = new GetThermoCalibrationLog();
            return getLog.GetThermometersDataSet(nKitchenId);
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }
}
