using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateSOPGroup : IBusinessLogic
    {
        private SOPGroup m_SOPGroup;

        public ProcessCreateSOPGroup()
        {
        }

        public void Invoke()
        {
            CreateSOPGroup createSOPGroup = new CreateSOPGroup();
            createSOPGroup.SOPGroup = this.m_SOPGroup;
            createSOPGroup.Insert();
            this.m_SOPGroup = createSOPGroup.SOPGroup;
        }

        public SOPGroup SOPGroup
        {
            get { return m_SOPGroup; }
            set { m_SOPGroup = value; }
        }
    }
}
