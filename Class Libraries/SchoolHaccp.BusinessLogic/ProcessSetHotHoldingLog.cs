using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetHotHoldingLog : IBusinessLogic
    {
        private HotHoldingLog m_HotHoldingLog;

        public ProcessSetHotHoldingLog()
        {
        }

        public void Invoke()
        {
            SetHotHoldingLog setHotHoldingLog = new SetHotHoldingLog();
            setHotHoldingLog.HotHoldingLog = this.m_HotHoldingLog;
            setHotHoldingLog.Update();
        }

        public HotHoldingLog HotHoldingLog
        {
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
        }
    }
}
