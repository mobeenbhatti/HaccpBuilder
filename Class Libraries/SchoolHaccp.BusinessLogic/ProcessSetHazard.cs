using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    class ProcessSetHazard
    {
         private Hazards m_Hazard;

        public ProcessSetHazard()
        {
        }

        public void Invoke()
        {
            SetHazards setHazard = new SetHazards();
            setHazard.Hazards = this.m_Hazard;
            setHazard.Update();
        }

        public Hazards Hazard
        {
            get { return m_Hazard; }
            set { m_Hazard = value; }
        }
    }
}
