
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateRefrigerationLog : IBusinessLogic
    {
        private RefrigerationLog m_RefrigerationLog;

        public ProcessCreateRefrigerationLog()
        {
        }

        public void Invoke()
        {
            CreateRefrigerationLog createRefrigerationLog = new CreateRefrigerationLog();
            createRefrigerationLog.RefrigerationLog = this.m_RefrigerationLog;
            createRefrigerationLog.Insert();
            this.m_RefrigerationLog = createRefrigerationLog.RefrigerationLog;
        }
        
        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }
}
