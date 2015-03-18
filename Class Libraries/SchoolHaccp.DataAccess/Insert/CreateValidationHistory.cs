using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateValidationHistory : DataAccessBase
    {
        private ValidationHistory m_ValidationHistory;

        public CreateValidationHistory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertValidationHistory.ToString();
        }

        public void Insert()
        {
            // int FoodSafetyValidationId = 0;
            CreateValidationHistoryDataParameters createParameters = new CreateValidationHistoryDataParameters(this.m_ValidationHistory);
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

            //using (DataServices dataServices = new DataServices(base.StoredProcedureName))
            //{
            //try
            //{
            //    object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            //    if (!int.TryParse(returnValue.ToString(), out FoodSafetyValidationId))
            //    {
            //        throw new Exception("Failed to retrieve ID value.");
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            //	this.m_WebBenefits.WebBenefitsId = webBenefitsId;
            //}
        }

        public ValidationHistory ValidationHistory
        {
            get { return m_ValidationHistory; }
            set { m_ValidationHistory = value; }
        }
    }

    public class CreateValidationHistoryDataParameters
    {
        private ValidationHistory m_ValidationHistory;
        object[] m_Parameters;

        public CreateValidationHistoryDataParameters(ValidationHistory ValidationHistory)
        {
            this.m_ValidationHistory = ValidationHistory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[11];
           // parameters[0] = this.m_ValidationHistory.HistoryId;
            parameters[0] = this.m_ValidationHistory.ResponsiblePerson;
            parameters[1] = this.m_ValidationHistory.KitchenId;
            parameters[2] = this.m_ValidationHistory.EntryDate;
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

            this.m_Parameters = parameters;
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