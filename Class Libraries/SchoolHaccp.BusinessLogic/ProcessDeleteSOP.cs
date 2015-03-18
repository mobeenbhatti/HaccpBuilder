using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteSOP : IBusinessLogic
    {
        private SOP m_SOP;

        public ProcessDeleteSOP()
        {
        }

        public void Invoke()
        {
            DeleteSOP deleteSOP = new DeleteSOP();
            deleteSOP.SOP = this.m_SOP;
            deleteSOP.Delete();
        }

        public SOP SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }
    }
}

