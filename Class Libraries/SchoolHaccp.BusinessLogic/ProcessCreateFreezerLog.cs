using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateFreezerLog : IBusinessLogic
    {
        private FreezerLog m_FreezerLog;

        public ProcessCreateFreezerLog()
        {
        }

        public void Invoke()
        {
            CreateFreezerLog createFreezerLog = new CreateFreezerLog();
            createFreezerLog.FreezerLog = this.m_FreezerLog;
            createFreezerLog.Insert();
            this.m_FreezerLog = createFreezerLog.FreezerLog;
        }
        public void Invoke(string strMode)
        {
            CreateFreezerLog createFreezerLog = new CreateFreezerLog();
            createFreezerLog.FreezerLog = this.m_FreezerLog;
            createFreezerLog.Insert("php");            
        }

        public FreezerLog FreezerLog
        {
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
        }
    }
}
