using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class CCPs
    {
        private int m_CCPId;
        private string m_CCP;
        private string m_Requirement;
        private int m_Active;       
        private int m_CCPGroupId;
        private int m_Additional;
        private int m_Custom;
        private string m_CPRequirement;
        // private int m_ChildCCPId;

        public int Active
        {
            get
            {
                return this.m_Active;
            }
            set
            {
                this.m_Active = value;
            }
        }
       

        public int Additional
        {
            get
            {
                return this.m_Additional;
            }
            set
            {
                this.m_Additional = value;
            }
        }

        public int CCPGroupId
        {
            get
            {
                return this.m_CCPGroupId;
            }
            set
            {
                this.m_CCPGroupId = value;
            }
        }

        /*public int ChildCCPId
        {
            get
            {
                return this.m_ChildCCPId;
            }
            set
            {
                this.m_ChildCCPId = value;
            }
        }*/

        public int Custom
        {
            get
            {
                return this.m_Custom;
            }
            set
            {
                this.m_Custom = value;
            }
        }

        public string CCP
        {
            get
            {
                return this.m_CCP;
            }
            set
            {
                this.m_CCP = value;
            }
        }
        public string Requirement
        {
            get
            {
                return this.m_Requirement;
            }
            set
            {
                this.m_Requirement = value;
            }
        }
        public string CPRequirement
        {
            get
            {
                return this.m_CPRequirement;
            }
            set
            {
                this.m_CPRequirement = value;
            }
        }

        public int CCPId
        {
            get
            {
                return this.m_CCPId;
            }
            set
            {
                this.m_CCPId = value;
            }
        }

        

    }
}
