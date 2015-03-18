using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteReceivingLog : IBusinessLogic
    {
        private ReceivingLog m_ReceivingLog;

        public ProcessDeleteReceivingLog()
        {
        }

        public void Invoke()
        {
            DeleteReceivingLog deleteReceivingLog = new DeleteReceivingLog();
            deleteReceivingLog.ReceivingLog = this.m_ReceivingLog;
            deleteReceivingLog.Delete();
        }

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }
}

