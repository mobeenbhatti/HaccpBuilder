
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateThermoCalibrationLog : IBusinessLogic
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public ProcessCreateThermoCalibrationLog()
        {
        }

        public void Invoke()
        {
            CreateThermoCalibrationLog createThermoCalibrationLog = new CreateThermoCalibrationLog();
            createThermoCalibrationLog.ThermoCalibrationLog = this.m_ThermoCalibrationLog;
            createThermoCalibrationLog.Insert();
            this.m_ThermoCalibrationLog = createThermoCalibrationLog.ThermoCalibrationLog;
        }
        public void Invoke(string strMode)
        {
            CreateThermoCalibrationLog createThermoCalibrationLog = new CreateThermoCalibrationLog();
            createThermoCalibrationLog.ThermoCalibrationLog = this.m_ThermoCalibrationLog;
                      
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }
}
