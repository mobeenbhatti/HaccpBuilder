using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateCCP : IBusinessLogic
    {
        private CCPs m_CCP;

        public ProcessCreateCCP()
        {
        }

        public void Invoke()
        {
            CreateCCP createCCP = new CreateCCP();
            createCCP.CCP = this.m_CCP;
            createCCP.Insert();
            this.m_CCP = createCCP.CCP;
        }

        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }
    }
}
