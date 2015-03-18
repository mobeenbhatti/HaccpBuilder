using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteCtpat : IBusinessLogic
    {
        private Ctpat m_Ctpat;

        public ProcessDeleteCtpat()
        {
        }

        public void Invoke()
        {
            DeleteCtpat deleteCtpat = new DeleteCtpat();
            deleteCtpat.Ctpat = this.m_Ctpat;
            deleteCtpat.Delete();
        }

        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }
    }
}
