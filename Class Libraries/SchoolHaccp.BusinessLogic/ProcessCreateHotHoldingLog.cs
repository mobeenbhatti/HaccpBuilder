
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateHotHoldingLog : IBusinessLogic
    {
        private HotHoldingLog m_HotHoldingLog;

        public ProcessCreateHotHoldingLog()
        {
        }

        public void Invoke()
        {
            CreateHotHoldingLog createHotHoldingLog = new CreateHotHoldingLog();
            createHotHoldingLog.HotHoldingLog = this.m_HotHoldingLog;
            createHotHoldingLog.Insert();
            this.m_HotHoldingLog = createHotHoldingLog.HotHoldingLog;
        }
        public void Invoke(string strMode)
        {
            CreateHotHoldingLog createHotHoldingLog = new CreateHotHoldingLog();
            createHotHoldingLog.HotHoldingLog = this.m_HotHoldingLog;
            createHotHoldingLog.Insert("php");
           
        }


        public HotHoldingLog HotHoldingLog
        {
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
        }
    }
}
