using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteThermoCalibrationLog : IBusinessLogic
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public ProcessDeleteThermoCalibrationLog()
        {
        }

        public void Invoke()
        {
            DeleteThermoCalibrationLog deleteThermoCalibrationLog = new DeleteThermoCalibrationLog();
            deleteThermoCalibrationLog.ThermoCalibrationLog = this.m_ThermoCalibrationLog;
            deleteThermoCalibrationLog.Delete();
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }
}

