using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteLunch : IBusinessLogic
    {
        private Lunch m_Lunch;

        public ProcessDeleteLunch()
        {
        }

        public void Invoke()
        {
            DeleteLunch deleteLunch = new DeleteLunch();
            deleteLunch.Lunch = this.m_Lunch;
            deleteLunch.Delete();
        }


        public Lunch Lunch
        {
            get { return m_Lunch; }
            set { m_Lunch = value; }
        }
    }
}

