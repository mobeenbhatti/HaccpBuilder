using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateResponseHistory : DataAccessBase
    {
        private ResponseHistory m_ResponseHistory;

        public CreateResponseHistory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertResponseHistory.ToString();
        }

        public void Insert()
        {
            // int FoodSafetyResponseId = 0;
            CreateResponseHistoryDataParameters createParameters = new CreateResponseHistoryDataParameters(this.m_ResponseHistory);
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

            //using (DataServices dataServices = new DataServices(base.StoredProcedureName))
            //{
            //try
            //{
            //    object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            //    if (!int.TryParse(returnValue.ToString(), out FoodSafetyResponseId))
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

        public ResponseHistory ResponseHistory
        {
            get { return m_ResponseHistory; }
            set { m_ResponseHistory = value; }
        }
    }

    public class CreateResponseHistoryDataParameters
    {
        private ResponseHistory m_ResponseHistory;
        object[] m_Parameters;

        public CreateResponseHistoryDataParameters(ResponseHistory responseHistory)
        {
            this.m_ResponseHistory = responseHistory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[6];
           // parameters[0] = this.m_ResponseHistory.HistoryId;
            parameters[0] = this.m_ResponseHistory.Observer;
            parameters[1] = this.m_ResponseHistory.ResponseWeek;
            parameters[2] = this.m_ResponseHistory.KitchenId;
            parameters[3] = this.m_ResponseHistory.Year;
            parameters[4] = this.m_ResponseHistory.EntryDate;
            parameters[5] = this.m_ResponseHistory.MobileId;


            this.m_Parameters = parameters;
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

