using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteBreakFast : IBusinessLogic
    {
        private BreakFast m_BreakFast;

        public ProcessDeleteBreakFast()
        {
        }

        public void Invoke()
        {
            DeleteBreakFast deleteBreakFast = new DeleteBreakFast();
            deleteBreakFast.BreakFast = this.m_BreakFast;
            deleteBreakFast.Delete();
        }
       

        public BreakFast BreakFast
        {
            get { return m_BreakFast; }
            set { m_BreakFast = value; }
        }
    }
}

