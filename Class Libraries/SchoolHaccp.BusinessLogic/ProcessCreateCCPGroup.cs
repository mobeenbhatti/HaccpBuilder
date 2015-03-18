using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateCCPGroup : IBusinessLogic
    {
        private CCPGroup m_CCPGroup;

        public ProcessCreateCCPGroup()
        {
        }

        public void Invoke()
        {
            CreateCCPGroup createCCPGroup = new CreateCCPGroup();
            createCCPGroup.CCPGroup = this.m_CCPGroup;
            createCCPGroup.Insert();
            this.m_CCPGroup = createCCPGroup.CCPGroup;
        }

        public CCPGroup CCPGroup
        {
            get { return m_CCPGroup; }
            set { m_CCPGroup = value; }
        }
    }
}
