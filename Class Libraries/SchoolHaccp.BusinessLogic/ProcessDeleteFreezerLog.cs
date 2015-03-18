using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteFreezerLog : IBusinessLogic
    {
        private FreezerLog m_FreezerLog;

        public ProcessDeleteFreezerLog()
        {
        }

        public void Invoke()
        {
            DeleteFreezerLog deleteFreezerLog = new DeleteFreezerLog();
            deleteFreezerLog.FreezerLog = this.m_FreezerLog;
            deleteFreezerLog.Delete();
        }

        public FreezerLog FreezerLog
        {
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
        }
    }
}

