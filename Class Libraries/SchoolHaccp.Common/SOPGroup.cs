using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class SOPGroup
    {
        private int m_SOPGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public SOPGroup()
        {
        }

        public int SOPGroupId
        {
            get { return m_SOPGroupId; }
            set { m_SOPGroupId = value; }
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
