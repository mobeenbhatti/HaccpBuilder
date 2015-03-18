using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetCCP : IBusinessLogic
    {
        private CCPs m_CCP;

        public ProcessSetCCP()
        {
        }

        public void Invoke()
        {
            SetCCP setCCP = new SetCCP();
            setCCP.CCP = this.m_CCP;
            setCCP.Update();
        }
        public void CCPSelection()
        {
            SetCCP setCCP = new SetCCP();
            setCCP.CCP = this.m_CCP;
            setCCP.UpdateSelection();
        }

        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }
    }
}
