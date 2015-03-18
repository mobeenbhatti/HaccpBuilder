using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteTemperatureLog : IBusinessLogic
    {
        private TemperatureLog m_TemperatureLog;

        public ProcessDeleteTemperatureLog()
        {
        }

        public void Invoke()
        {
            DeleteTemperatureLog deleteTemperatureLog = new DeleteTemperatureLog();
            deleteTemperatureLog.TemperatureLog = this.m_TemperatureLog;
            deleteTemperatureLog.Delete();
        }

        public TemperatureLog TemperatureLog
        {
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
        }
    }
}

