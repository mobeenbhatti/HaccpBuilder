using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessCreateHazard:IBusinessLogic
    {
        private Hazards m_Hazard;

        public ProcessCreateHazard()
        {
        }

        public void Invoke()
        {
            CreateHazards createHazard = new CreateHazards();
            createHazard.Hazards = this.m_Hazard;
            createHazard.Insert();
            this.m_Hazard = createHazard.Hazards;
        }
        public void Invoke(string strMode)
        {
            CreateHazards createHazard = new CreateHazards();
            createHazard.Hazards = this.m_Hazard;
            createHazard.Insert("php");
           
        }


        public Hazards Hazard
        {
            get { return m_Hazard; }
            set { m_Hazard = value; }
        }
    }
}
