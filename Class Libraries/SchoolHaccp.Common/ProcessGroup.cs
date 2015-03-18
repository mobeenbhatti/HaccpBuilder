using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class ProcessGroup
    {
        private int m_ProcessGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public ProcessGroup()
        {
        }

        public int ProcessGroupId
        {
            get { return m_ProcessGroupId; }
            set { m_ProcessGroupId = value; }
        }
        public string GroupName
        {
            get { return m_GroupName; }
            set { m_GroupName = value; }
        }
        public int DistrictId
        {
            get { return m_DistrictId; }
            set { m_DistrictId = value; }
        }
    }
}
