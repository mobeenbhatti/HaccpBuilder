using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
    class ChecklistAddOnGroup
    {
        private int m_CheckListAddOnGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public ChecklistAddOnGroup()
        {
        }

        public int CheckListAddOnGroupId
        {
            get { return m_CheckListAddOnGroupId; }
            set { m_CheckListAddOnGroupId = value; }
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
