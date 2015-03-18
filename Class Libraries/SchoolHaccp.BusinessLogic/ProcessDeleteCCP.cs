using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteCCP : IBusinessLogic
    {
        private CCPs m_CCP;

        public ProcessDeleteCCP()
        {
        }

        public void Invoke()
        {
            DeleteCCP deleteCCP = new DeleteCCP();
            deleteCCP.CCP = this.m_CCP;
            deleteCCP.Delete();
        }

        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }
    }
}

