using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateCtpat : IBusinessLogic
    {
        private Ctpat m_Ctpat;

        public ProcessCreateCtpat()
        {
        }

        public void Invoke()
        {
            CreateCtpat createCtpat = new CreateCtpat();
            createCtpat.Ctpat = this.m_Ctpat;
            createCtpat.Insert();
            this.m_Ctpat = createCtpat.Ctpat;
        }

        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }
    }
}

