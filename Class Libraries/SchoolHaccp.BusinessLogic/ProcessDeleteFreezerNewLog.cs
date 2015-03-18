using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteFreezerNewLog : IBusinessLogic
    {
        private FreezerNewLog m_FreezerNewLog;

        public ProcessDeleteFreezerNewLog()
        {
        }

        public void Invoke()
        {
            DeleteFreezerNewLog deleteFreezerNewLog = new DeleteFreezerNewLog();
            deleteFreezerNewLog.FreezerNewLog = this.m_FreezerNewLog;
            deleteFreezerNewLog.Delete();
        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }
}


