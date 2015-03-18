using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteRefrigerationLog : IBusinessLogic
    {
        private RefrigerationLog m_RefrigerationLog;

        public ProcessDeleteRefrigerationLog()
        {
        }

        public void Invoke()
        {
            DeleteRefrigerationLog deleteRefrigerationLog = new DeleteRefrigerationLog();
            deleteRefrigerationLog.RefrigerationLog = this.m_RefrigerationLog;
            deleteRefrigerationLog.Delete();
        }

        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }
}

