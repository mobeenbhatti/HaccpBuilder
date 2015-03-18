using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetThermoCalibrationLog : IBusinessLogic
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public ProcessSetThermoCalibrationLog()
        {
        }

        public void Invoke()
        {
            SetThermoCalibrationLog setThermoCalibrationLog = new SetThermoCalibrationLog();
            setThermoCalibrationLog.ThermoCalibrationLog = this.m_ThermoCalibrationLog;
            setThermoCalibrationLog.Update();
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }
}
