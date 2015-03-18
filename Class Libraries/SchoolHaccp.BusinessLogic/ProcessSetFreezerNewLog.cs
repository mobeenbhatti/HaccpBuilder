using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetFreezerNewLog : IBusinessLogic
    {
        private FreezerNewLog m_FreezerNewLog;

        public ProcessSetFreezerNewLog()
        {
        }

        public void Invoke()
        {
            SetFreezerNewLog setFreezerNewLog = new SetFreezerNewLog();
            setFreezerNewLog.FreezerNewLog = this.m_FreezerNewLog;
            setFreezerNewLog.Update();
        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }
}

