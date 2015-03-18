using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateValidationResponse : DataAccessBase
	{
		private ValidationResponse m_ValidationResponse;

        public CreateValidationResponse()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertValidationResponse.ToString();
		}

		public void Insert()
		{
           // int ValidationResponseId = 0;
            CreateValidationResponseDataParameters createParameters = new CreateValidationResponseDataParameters(this.m_ValidationResponse);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
           
           object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
            
            //using (DataServices dataServices = new DataServices(base.StoredProcedureName))
            //{
            //try
            //{
            //    object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            //    if (!int.TryParse(returnValue.ToString(), out ValidationResponseId))
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
        public void Insert(string strMode)
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_ValidationResponse.KitchenId;
            parameters[1] = this.m_ValidationResponse.QuestionId;
            parameters[2] = this.m_ValidationResponse.Answer;
            parameters[3] = this.m_ValidationResponse.CorrectiveAction;
            parameters[4] = this.m_ValidationResponse.ValidationHistoryId;
            DataServices dataServices = new DataServices("uspAdm_InsertValidationResponsePHP");
            object returnValue = dataServices.ExecuteScalar(parameters);
            
        }

        public ValidationResponse ValidationResponse
		{
            get { return m_ValidationResponse; }
            set { m_ValidationResponse = value; }
		}
	}

	public class CreateValidationResponseDataParameters
	{
        private ValidationResponse m_ValidationResponse;
		object[] m_Parameters;

        public CreateValidationResponseDataParameters(ValidationResponse ValidationResponse)
		{
            this.m_ValidationResponse = ValidationResponse;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[4];            
            parameters[0] = this.m_ValidationResponse.QuestionId;
            parameters[1] = this.m_ValidationResponse.Answer;
            parameters[2] = this.m_ValidationResponse.CorrectiveAction;
            parameters[3] = this.m_ValidationResponse.ValidationHistoryId;
			this.m_Parameters = parameters;
		}
       
        public ValidationResponse ValidationResponse
		{
            get { return m_ValidationResponse; }
            set { m_ValidationResponse = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
