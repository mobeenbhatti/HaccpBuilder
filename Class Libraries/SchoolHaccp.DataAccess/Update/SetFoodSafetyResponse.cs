using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetFoodSafetyResponse : DataAccessBase
    {
        private FoodSafetyResponse  m_FoodSafetyResponse;

        public SetFoodSafetyResponse()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateFoodSafetyResponses.ToString();
        }

        public void Update()
        {
            SetFoodSafetyResponseParameters setParameters = new SetFoodSafetyResponseParameters(this.m_FoodSafetyResponse);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public FoodSafetyResponse FoodSafetyResponse
        {
            get { return m_FoodSafetyResponse; }
            set { m_FoodSafetyResponse = value; }
        }
    }

    public class SetFoodSafetyResponseParameters
    {
        private FoodSafetyResponse m_FoodSafetyResponse;
        object[] m_Parameters;

        public SetFoodSafetyResponseParameters(FoodSafetyResponse foodsafetyresponse)
        {
            this.m_FoodSafetyResponse = foodsafetyresponse;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[5];
           // parameters[0] = this.m_FoodSafetyResponse.ResponseId;
            parameters[0] = this.m_FoodSafetyResponse.KitchenId;
            parameters[1] = this.m_FoodSafetyResponse.QuestionId;
            parameters[2] = this.m_FoodSafetyResponse.Answer;
            parameters[3] = this.m_FoodSafetyResponse.CorrectiveAction;
            parameters[4] = this.m_FoodSafetyResponse.HistoryId;

            Parameters = parameters;
        }

        public FoodSafetyResponse FoodSafetyResponse
        {
            get { return m_FoodSafetyResponse; }
            set { m_FoodSafetyResponse = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}

