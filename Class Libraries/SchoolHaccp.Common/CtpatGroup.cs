using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
    public class CtpatGroup
    {
        private int m_CtpatGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public CtpatGroup()
        {
        }

        public int CtpatGroupId
        {
            get { return m_CtpatGroupId; }
            set { m_CtpatGroupId = value; }
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
