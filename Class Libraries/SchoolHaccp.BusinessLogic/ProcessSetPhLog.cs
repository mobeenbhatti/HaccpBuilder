using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
 public  class ProcessSetPhLog
    {
         private PhLog m_PhLog;

        public ProcessSetPhLog()
        {
        }

        public void Invoke()
        {
            SetPhLog setPhLog = new SetPhLog();
            setPhLog.PhLog = this.m_PhLog;
            setPhLog.Update();
        }

        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }
    }
}
