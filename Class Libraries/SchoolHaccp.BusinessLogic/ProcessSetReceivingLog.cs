using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetReceivingLog : IBusinessLogic
    {
        private ReceivingLog m_ReceivingLog;

        public ProcessSetReceivingLog()
        {
        }

        public void Invoke()
        {
            SetReceivingLog setReceivingLog = new SetReceivingLog();
            setReceivingLog.ReceivingLog = this.m_ReceivingLog;
            setReceivingLog.Update();
        }

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }
}
