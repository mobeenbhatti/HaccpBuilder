using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateCtpatGroup : IBusinessLogic
    {
        private CtpatGroup m_CtpatGroup;

        public ProcessCreateCtpatGroup()
        {
        }

        public void Invoke()
        {
            CreateCtpatGroup createCtpatGroup = new CreateCtpatGroup();
            createCtpatGroup.CtpatGroup = this.m_CtpatGroup;
            createCtpatGroup.Insert();
            this.m_CtpatGroup = createCtpatGroup.CtpatGroup;
        }

        public CtpatGroup CtpatGroup
        {
            get { return m_CtpatGroup; }
            set { m_CtpatGroup = value; }
        }
    }
}
