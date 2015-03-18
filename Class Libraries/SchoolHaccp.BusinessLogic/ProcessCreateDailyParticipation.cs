using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateDailyParticipation : IBusinessLogic
    {
        private KitchenDetails m_KitchenDetails;

        public ProcessCreateDailyParticipation()
        {
        }

        public void Invoke()
        {
            CreateDailyParticipation createDailyParticipation = new CreateDailyParticipation();
            createDailyParticipation.KitchenDetails = this.KitchenDetails;
            createDailyParticipation.Insert();
          this.KitchenDetails=createDailyParticipation.KitchenDetails;
        }
        //public void Invoke(string strMode)
        //{
        //    CreateDailyParticipation createDailyParticipation = new CreateDailyParticipation();
        //    createDailyParticipation.KitchenDetails = this.KitchenDetails;
        //    createDailyParticipation.Insert("php");
           
        //}

        public KitchenDetails KitchenDetails
        {
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
        }
    }
}
