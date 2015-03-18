using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    class ProcessCreateCriticalLimits: IBusinessLogic
    {
        private CriticalLimit m_CriticalLimits;

        public ProcessCreateCriticalLimits()
        {
        }

        public void Invoke()
        {
            CreateCriticalLimits createCriticalLimits = new CreateCriticalLimits();
            createCriticalLimits.CriticalLimit = this.m_CriticalLimits;
            createCriticalLimits.Insert();
            this.m_CriticalLimits = createCriticalLimits.CriticalLimit;
        }       

        public CriticalLimit CriticalLimits
        {
            get { return m_CriticalLimits; }
            set { m_CriticalLimits = value; }
        }
    }
}

