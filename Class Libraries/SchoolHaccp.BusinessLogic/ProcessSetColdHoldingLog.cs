using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetColdHoldingLog : IBusinessLogic
    {
        private ColdHoldingLog m_ColdHoldingLog;

        public ProcessSetColdHoldingLog()
        {
        }

        public void Invoke()
        {
            SetColdHoldingLog setColdHoldingLog = new SetColdHoldingLog();
            setColdHoldingLog.ColdHoldingLog = this.m_ColdHoldingLog;
            setColdHoldingLog.Update();
        }

        public ColdHoldingLog ColdHoldingLog
        {
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
        }
    }
}
