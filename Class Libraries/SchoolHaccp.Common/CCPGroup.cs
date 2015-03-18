using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class CCPGroup
    {
        private int m_CCPGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public CCPGroup()
        {
        }

        public int CCPGroupId
        {
            get { return m_CCPGroupId; }
            set { m_CCPGroupId = value; }
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
