using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateLunch : IBusinessLogic
    {
        private Lunch m_Lunch;

        public ProcessCreateLunch()
        {
        }

        public void Invoke()
        {
            CreateLunch createLunch = new CreateLunch();
            createLunch.Lunch = this.Lunch;
            createLunch.Insert();
            this.Lunch = createLunch.Lunch;
        }

        public Lunch Lunch
        {
            get { return m_Lunch; }
            set { m_Lunch = value; }
        }
    }
}
