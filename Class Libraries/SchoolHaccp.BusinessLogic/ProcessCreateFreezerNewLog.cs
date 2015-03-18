
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateFreezerNewLog : IBusinessLogic
    {
        private FreezerNewLog m_FreezerNewLog;

        public ProcessCreateFreezerNewLog()
        {
        }

        public void Invoke()
        {
            CreateFreezerNewLog createFreezerNewLog = new CreateFreezerNewLog();
            createFreezerNewLog.FreezerNewLog = this.m_FreezerNewLog;
            createFreezerNewLog.Insert();
            this.m_FreezerNewLog = createFreezerNewLog.FreezerNewLog;
        }
        public void Invoke(string strMode)
        {
            CreateFreezerNewLog createFreezerNewLog = new CreateFreezerNewLog();
            createFreezerNewLog.FreezerNewLog = this.m_FreezerNewLog;
            createFreezerNewLog.Insert("php");            
        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }
}

