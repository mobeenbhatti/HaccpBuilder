
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateReceivingLog : IBusinessLogic
    {
        private ReceivingLog m_ReceivingLog;

        public ProcessCreateReceivingLog()
        {
        }

        public void Invoke()
        {
            CreateReceivingLog createReceivingLog = new CreateReceivingLog();
            createReceivingLog.ReceivingLog = this.m_ReceivingLog;
            createReceivingLog.Insert();
            this.m_ReceivingLog = createReceivingLog.ReceivingLog;
        }
       

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }
}
