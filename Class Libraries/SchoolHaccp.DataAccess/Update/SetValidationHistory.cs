using SchoolHaccp.Common;
using System;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetValidationHistory : DataAccessBase
    {
        private ValidationHistory  m_ValidationHistory;

        public SetValidationHistory()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateValidationHistory.ToString();
        }

        public void Update()
        {
            SetValidationHistoryParameters setParameters = new SetValidationHistoryParameters(this.m_ValidationHistory);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }
        public void UpdateStatus(int nHistroyId, int nComplete, DateTime dtEntrydate)
        {
            object[] parameters = new object[3];
            parameters[0] = nHistroyId;
            parameters[1] = nComplete;
            parameters[2] = dtEntrydate;
            DataServices dataServices = new DataServices("uspAdm_UpdateValidationHistoryStatus");
            dataServices.ExecuteNonQuery(parameters);
        }

        public ValidationHistory ValidationHistory
        {
            get { return m_ValidationHistory; }
            set { m_ValidationHistory = value; }
        }
    }

    public class SetValidationHistoryParameters
    {
        private ValidationHistory m_ValidationHistory;
        object[] m_Parameters;

        public SetValidationHistoryParameters(ValidationHistory ValidationHistory)
        {
            this.m_ValidationHistory = ValidationHistory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[11];
            parameters[0] = this.m_ValidationHistory.ValidationHistoryId;
            parameters[1] = this.m_ValidationHistory.ResponsiblePerson;
            parameters[2] = this.m_ValidationHistory.KitchenId;            
            parameters[3] = this.m_ValidationHistory.Title;
            parameters[4] = this.m_ValidationHistory.VerifiedBy;
            parameters[5] = this.m_ValidationHistory.ValidationLastdate;
            parameters[6] = this.m_ValidationHistory.ValidationDueDate;
            parameters[7] = this.m_ValidationHistory.Frequency;
            parameters[8] = this.m_ValidationHistory.TimePeriod;
            //parameters[9] = this.m_ValidationHistory.TimePeriodMode;
            //parameters[10] = this.m_ValidationHistory.FrequencyMode;
            parameters[9] = this.m_ValidationHistory.ManagerTitle;
            parameters[10] = this.m_ValidationHistory.Reason;


            Parameters = parameters;
        }

        public ValidationHistory ValidationHistory
        {
            get { return m_ValidationHistory; }
            set { m_ValidationHistory = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
