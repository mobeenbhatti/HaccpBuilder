using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteFoodSafetyQuestion : DataAccessBase
    {
        private FoodSafetyQuestion m_FoodSafetyQuestion;

		public DeleteFoodSafetyQuestion()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteQuestionById.ToString();
		}

		public void Delete()
		{

            //DeleteFoodSafetyQuestionDataParameters DeleteParameters = new DeleteFoodSafetyQuestionDataParameters(this.m_FoodSafetyQuestion);
            
            object[] parameters = new object[1];
            parameters[0] = this.FoodSafetyQuestion.QuestionId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters); 
           
		}

        public FoodSafetyQuestion FoodSafetyQuestion
		{
            get { return m_FoodSafetyQuestion; }
            set { m_FoodSafetyQuestion = value; }
		}
	}

	public class DeleteFoodSafetyQuestionDataParameters
	{
		private FoodSafetyQuestion m_FoodSafetyQuestion;
		object[] m_Parameters;

        public DeleteFoodSafetyQuestionDataParameters(FoodSafetyQuestion FoodSafetyQuestion)
		{
            this.m_FoodSafetyQuestion = FoodSafetyQuestion;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];            
            parameters[0] = this.FoodSafetyQuestion.QuestionId;
            Parameters = parameters;
		}

        public FoodSafetyQuestion FoodSafetyQuestion
		{
            get { return m_FoodSafetyQuestion; }
            set { m_FoodSafetyQuestion = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
    
}
