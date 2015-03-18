using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateSOP : IBusinessLogic
    {
        private SOP m_SOP;

        public ProcessCreateSOP()
        {
        }

        public void Invoke()
        {
            CreateSOP createSOP = new CreateSOP();
            createSOP.SOP = this.m_SOP;
            createSOP.Insert();
            this.m_SOP = createSOP.SOP;
        }       

        public SOP SOP
        {
            get { return m_SOP; }
            set { m_SOP = value; }
        }
    }
}
