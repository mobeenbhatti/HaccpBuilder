using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetRefrigerationLog : IBusinessLogic
    {
        private RefrigerationLog m_RefrigerationLog;

        public ProcessSetRefrigerationLog()
        {
        }

        public void Invoke()
        {
            SetRefrigerationLog setRefrigerationLog = new SetRefrigerationLog();
            setRefrigerationLog.RefrigerationLog = this.m_RefrigerationLog;
            setRefrigerationLog.Update();
        }

        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }
}
