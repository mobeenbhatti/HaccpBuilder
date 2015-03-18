using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class ValidationGroup
    {
         private int m_ValidationGroupId;
        private string m_GroupName;
        private int m_DistrictId;


        public ValidationGroup()
        {
        }

        public int ValidationGroupId
        {
            get { return m_ValidationGroupId; }
            set { m_ValidationGroupId = value; }
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
