using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;
namespace SchoolHaccp.BusinessLogic
{
   public class ProcessCreatePhLog
    {
        private PhLog m_PhLog;

        public ProcessCreatePhLog()
        {
        }

        public void Invoke()
        {
            CreatePhLog createPhLog = new CreatePhLog();
            createPhLog.PhLog = this.m_PhLog;
            createPhLog.Insert();
            this.m_PhLog = createPhLog.PhLog;
        }       

        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }
    }
}
