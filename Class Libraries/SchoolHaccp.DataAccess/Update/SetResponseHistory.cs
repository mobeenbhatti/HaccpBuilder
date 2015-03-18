using SchoolHaccp.Common;
using System;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetResponseHistory : DataAccessBase
    {
        private ResponseHistory  m_ResponseHistory;

        public SetResponseHistory()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateReponseHistory.ToString();
        }

        public void Update()
        {
            SetResponseHistoryParameters setParameters = new SetResponseHistoryParameters(this.m_ResponseHistory);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }
        public void UpdateStatus(int nHistroyId, int nComplete, DateTime dtEntrydate)
        {
            object[] parameters = new object[3];
            parameters[0] = nHistroyId;
            parameters[1] = nComplete;
            parameters[2] = dtEntrydate;
            DataServices dataServices = new DataServices("uspAdm_UpdateReponseHistoryStatus");
            dataServices.ExecuteNonQuery(parameters);
        }

        public ResponseHistory ResponseHistory
        {
            get { return m_ResponseHistory; }
            set { m_ResponseHistory = value; }
        }
    }

    public class SetResponseHistoryParameters
    {
        private ResponseHistory m_ResponseHistory;
        object[] m_Parameters;

        public SetResponseHistoryParameters(ResponseHistory responseHistory)
        {
            this.m_ResponseHistory = responseHistory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[6];
            parameters[0] = this.m_ResponseHistory.HistoryId;
            parameters[1] = this.m_ResponseHistory.KitchenId;
            parameters[2] = this.m_ResponseHistory.Observer;
            parameters[3] = this.m_ResponseHistory.ResponseWeek;
            parameters[4] = this.m_ResponseHistory.Year;
            parameters[5] = this.m_ResponseHistory.EntryDate;

            Parameters = parameters;
        }

        public ResponseHistory ResponseHistory
        {
            get { return m_ResponseHistory; }
            set { m_ResponseHistory = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}

