using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteColdHoldingLog : IBusinessLogic
    {
        private ColdHoldingLog m_ColdHoldingLog;

        public ProcessDeleteColdHoldingLog()
        {
        }

        public void Invoke()
        {
            DeleteColdHoldingLog deleteColdHoldingLog = new DeleteColdHoldingLog();
            deleteColdHoldingLog.ColdHoldingLog = this.m_ColdHoldingLog;
            deleteColdHoldingLog.Delete();
        }

        public ColdHoldingLog ColdHoldingLog
        {
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
        }
    }
}

