using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetFreezerLog : IBusinessLogic
    {
        private FreezerLog m_FreezerLog;

        public ProcessSetFreezerLog()
        {
        }

        public void Invoke()
        {
            SetFreezerLog setFreezerLog = new SetFreezerLog();
            setFreezerLog.FreezerLog = this.m_FreezerLog;
            setFreezerLog.Update();
        }

        public FreezerLog FreezerLog
        {
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
        }
    }
}
