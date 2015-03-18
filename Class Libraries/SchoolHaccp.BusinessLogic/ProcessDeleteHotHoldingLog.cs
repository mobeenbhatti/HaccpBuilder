using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteHotHoldingLog : IBusinessLogic
    {
        private HotHoldingLog m_HotHoldingLog;

        public ProcessDeleteHotHoldingLog()
        {
        }

        public void Invoke()
        {
            DeleteHotHoldingLog deleteHotHoldingLog = new DeleteHotHoldingLog();
            deleteHotHoldingLog.HotHoldingLog = this.m_HotHoldingLog;
            deleteHotHoldingLog.Delete();
        }

        public HotHoldingLog HotHoldingLog
        {
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
        }
    }
}

