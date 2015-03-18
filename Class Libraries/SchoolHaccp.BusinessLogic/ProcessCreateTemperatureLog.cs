using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateTemperatureLog : IBusinessLogic
    {
        private TemperatureLog m_TemperatureLog;

        public ProcessCreateTemperatureLog()
        {
        }

        public void Invoke()
        {
            CreateTemperatureLog createTemperatureLog = new CreateTemperatureLog();
            createTemperatureLog.TemperatureLog = this.m_TemperatureLog;
            createTemperatureLog.Insert();
            this.m_TemperatureLog = createTemperatureLog.TemperatureLog;
        }
        public void Invoke(string strMode)
        {
            CreateTemperatureLog createTemperatureLog = new CreateTemperatureLog();
            createTemperatureLog.TemperatureLog = this.m_TemperatureLog;
           
        }

        public TemperatureLog TemperatureLog
        {
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
        }
    }
}
