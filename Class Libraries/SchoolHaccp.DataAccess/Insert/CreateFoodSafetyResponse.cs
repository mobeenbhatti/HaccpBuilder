
using System;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateFoodSafetyResponse : DataAccessBase
	{
		private FoodSafetyResponse m_FoodSafetyResponse;

        public CreateFoodSafetyResponse()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertFoodSafetyResponses.ToString();
		}

		public void Insert()
		{
           // int FoodSafetyResponseId = 0;
            CreateFoodSafetyResponseDataParameters createParameters = new CreateFoodSafetyResponseDataParameters(this.m_FoodSafetyResponse);
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
        public void Insert(string strMode)
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_FoodSafetyResponse.KitchenId;
            parameters[1] = this.m_FoodSafetyResponse.QuestionId;
            parameters[2] = this.m_FoodSafetyResponse.Answer;
            parameters[3] = this.m_FoodSafetyResponse.CorrectiveAction;
            parameters[4] = this.m_FoodSafetyResponse.HistoryId;
            DataServices dataServices = new DataServices("uspAdm_InsertFoodSafetyResponsePHP");
            object returnValue = dataServices.ExecuteScalar(parameters);
            
        }

        public FoodSafetyResponse FoodSafetyResponse
		{
            get { return m_FoodSafetyResponse; }
            set { m_FoodSafetyResponse = value; }
		}
	}

	public class CreateFoodSafetyResponseDataParameters
	{
        private FoodSafetyResponse m_FoodSafetyResponse;
		object[] m_Parameters;

        public CreateFoodSafetyResponseDataParameters(FoodSafetyResponse foodSafetyResponse)
		{
            this.m_FoodSafetyResponse = foodSafetyResponse;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[3];
            parameters[0] = this.m_FoodSafetyResponse.KitchenId;
            parameters[1] = this.m_FoodSafetyResponse.QuestionId;
            //parameters[2] = this.m_FoodSafetyResponse.Answer;
            //parameters[3] = this.m_FoodSafetyResponse.CorrectiveAction;
            parameters[2] = this.m_FoodSafetyResponse.HistoryId;
			this.m_Parameters = parameters;
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

