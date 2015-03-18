using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateBreakFast : IBusinessLogic
    {
        private BreakFast m_BreakFast;

        public ProcessCreateBreakFast()
        {
        }

        public void Invoke()
        {
            CreateBreakFast createBreakFast = new CreateBreakFast();
            createBreakFast.BreakFast = this.BreakFast;
            createBreakFast.Insert();
            this.BreakFast = createBreakFast.BreakFast;
        }

        public BreakFast BreakFast
        {
            get { return m_BreakFast; }
            set { m_BreakFast = value; }
        }
    }
}
