using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetCtpat : IBusinessLogic
    {
        private Ctpat m_Ctpat;

        public ProcessSetCtpat()
        {
        }

        public void Invoke()
        {
            SetCtpat setCtpat = new SetCtpat();
            setCtpat.Ctpat = this.m_Ctpat;
            setCtpat.Update();
        }
        public void CtpatSelection()
        {
            SetCtpat setCtpat = new SetCtpat();
            setCtpat.Ctpat = this.m_Ctpat;
            setCtpat.UpdateSelection();
        }

        public Ctpat Ctpat
        {
            get { return m_Ctpat; }
            set { m_Ctpat = value; }
        }
    }
}
