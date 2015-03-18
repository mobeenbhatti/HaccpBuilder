using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateColdHoldingLog : IBusinessLogic
    {
        private ColdHoldingLog m_ColdHoldingLog;

        public ProcessCreateColdHoldingLog()
        {
        }

        public void Invoke()
        {
            CreateColdHoldingLog createColdHoldingLog = new CreateColdHoldingLog();
            createColdHoldingLog.ColdHoldingLog = this.m_ColdHoldingLog;
            createColdHoldingLog.Insert();
            this.m_ColdHoldingLog = createColdHoldingLog.ColdHoldingLog;
        }
        public void Invoke(string strMode)
        {
            CreateColdHoldingLog createColdHoldingLog = new CreateColdHoldingLog();
            createColdHoldingLog.ColdHoldingLog = this.m_ColdHoldingLog;
            createColdHoldingLog.Insert("php");
           
        }


        public ColdHoldingLog ColdHoldingLog
        {
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
        }
    }
}
