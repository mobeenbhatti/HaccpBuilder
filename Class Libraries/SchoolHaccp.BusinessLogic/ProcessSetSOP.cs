using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetSOP : IBusinessLogic
    {
        private SOP m_SOP;

        public ProcessSetSOP()
        {
        }

        public void Invoke()
        {
            SetSOP setSOP = new SetSOP();
            setSOP.SOP = this.m_SOP;
            setSOP.Update();
        }
        public void SOPSelection()
        {
            SetSOP setSOP = new SetSOP();
            setSOP.SOP = this.m_SOP;
            setSOP.UpdateSelection();
        }

        public SOP SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }
    }
}
