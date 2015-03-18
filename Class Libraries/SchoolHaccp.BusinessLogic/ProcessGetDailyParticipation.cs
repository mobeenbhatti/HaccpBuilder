using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetDailyParticipation : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private KitchenDetails m_KitchenDetails;

        public ProcessGetDailyParticipation()
        {
        }

        public void Invoke()
        {
            GetDailyParticipation getDailyParticipation = new GetDailyParticipation();
            getDailyParticipation.KitchenDetails = this.KitchenDetails;
            
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
       
        public IDataReader GetDailyParticipationByKitchenId(int nKitchenId)
        {
            GetDailyParticipation getDailyParticipation = new GetDailyParticipation();
            return getDailyParticipation.GetKitchenDetailsByKitchenId(nKitchenId);
        }
        


        public KitchenDetails KitchenDetails
        {
            get { return m_KitchenDetails; }
            set { m_KitchenDetails = value; }
        }
    }
}
