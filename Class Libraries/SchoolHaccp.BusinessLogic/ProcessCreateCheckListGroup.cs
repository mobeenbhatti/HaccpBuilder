using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateCheckListGroup : IBusinessLogic
    {
        private CheckListGroup m_CheckListGroup;

        public ProcessCreateCheckListGroup()
        {
        }

        public void Invoke()
        {
            CreateCheckListGroup createCheckListGroup = new CreateCheckListGroup();
            createCheckListGroup.CheckListGroup = this.m_CheckListGroup;
            createCheckListGroup.Insert();
            this.m_CheckListGroup = createCheckListGroup.CheckListGroup;
        }

        public CheckListGroup CheckListGroup
        {
            get { return m_CheckListGroup; }
            set { m_CheckListGroup = value; }
        }
    }
}
