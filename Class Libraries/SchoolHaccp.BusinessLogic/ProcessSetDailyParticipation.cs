using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetDailyParticipation : IBusinessLogic
    {
        private KitchenDetails m_KitchenDetails;

        public ProcessSetDailyParticipation()
        {
        }

        public void Invoke()
        {
            SetDailyParticipation setDailyParticipation = new SetDailyParticipation();
            setDailyParticipation.KitchenDetails = this.KitchenDetails;
            setDailyParticipation.Update();
        }

        public KitchenDetails KitchenDetails
        {
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
        }
    }
}
