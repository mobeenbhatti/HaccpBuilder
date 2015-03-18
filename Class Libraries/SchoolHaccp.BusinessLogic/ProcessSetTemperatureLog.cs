using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetTemperatureLog : IBusinessLogic
    {
        private TemperatureLog m_TemperatureLog;

        public ProcessSetTemperatureLog()
        {
        }

        public void Invoke()
        {
            SetTemperatureLog setTemperatureLog = new SetTemperatureLog();
            setTemperatureLog.TemperatureLog = this.m_TemperatureLog;
            setTemperatureLog.Update();
        }

        public TemperatureLog TemperatureLog
        {
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
        }
    }
}
