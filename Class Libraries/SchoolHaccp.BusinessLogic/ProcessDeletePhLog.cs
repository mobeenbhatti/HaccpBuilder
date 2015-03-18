using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessDeletePhLog
    {
         private PhLog m_PhLog;

        public ProcessDeletePhLog()
        {
        }

        public void Invoke()
        {
            DeletePhLog deletePhLog = new DeletePhLog();
            deletePhLog.PhLog = this.m_PhLog;
            deletePhLog.Delete();
        }

        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }
    }
}
