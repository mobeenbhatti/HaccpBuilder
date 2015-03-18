using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class CheckListGroup
    {
        private int m_CheckListGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public CheckListGroup()
        {
        }

        public int CheckListGroupId
        {
            get { return m_CheckListGroupId; }
            set { m_CheckListGroupId = value; }
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
