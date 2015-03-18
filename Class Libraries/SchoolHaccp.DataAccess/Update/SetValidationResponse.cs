using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetValidationResponse : DataAccessBase
    {
        private ValidationResponse  m_ValidationResponse;

        public SetValidationResponse()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateValidationResponses.ToString();
        }

        public void Update()
        {
            SetValidationResponseParameters setParameters = new SetValidationResponseParameters(this.m_ValidationResponse);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public ValidationResponse ValidationResponse
        {
            get { return m_ValidationResponse; }
            set { m_ValidationResponse = value; }
        }
    }

    public class SetValidationResponseParameters
    {
        private ValidationResponse m_ValidationResponse;
        object[] m_Parameters;

        public SetValidationResponseParameters(ValidationResponse Validationresponse)
        {
            this.m_ValidationResponse = Validationresponse;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[5];
           // parameters[0] = this.m_ValidationResponse.ResponseId;
            parameters[0] = this.m_ValidationResponse.KitchenId;
            parameters[1] = this.m_ValidationResponse.QuestionId;
            parameters[2] = this.m_ValidationResponse.Answer;
            parameters[3] = this.m_ValidationResponse.CorrectiveAction;
            parameters[4] = this.m_ValidationResponse.ValidationHistoryId;

            Parameters = parameters;
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

