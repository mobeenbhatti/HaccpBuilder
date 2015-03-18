using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetCriticalLimits: IBusinessLogic
    {
        private CriticalLimit m_CriticalLimits;

        public ProcessSetCriticalLimits()
        {
        }

        public void Invoke()
        {
            SetCriticalLimits setCriticalLimits = new SetCriticalLimits();
            setCriticalLimits.CriticalLimit = this.m_CriticalLimits;
            setCriticalLimits.Update();
        }

        public CriticalLimit CriticalLimits
        {
            get { return m_CriticalLimits; }
            set { m_CriticalLimits = value; }
        }
    }
}