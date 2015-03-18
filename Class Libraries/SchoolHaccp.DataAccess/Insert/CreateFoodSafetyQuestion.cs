using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert 
{
  public  class CreateFoodSafetyQuestion : DataAccessBase
    {
        private FoodSafetyQuestion m_FoodSafetyQuestion;

		public CreateFoodSafetyQuestion()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertQuestionByGroupId.ToString();
		}

		public void Insert()
		{

            CreateFoodSafetyQuestionDataParameters createParameters = new CreateFoodSafetyQuestionDataParameters(this.m_FoodSafetyQuestion);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
       

        public FoodSafetyQuestion FoodSafetyQuestion
		{
            get { return m_FoodSafetyQuestion; }
            set { m_FoodSafetyQuestion = value; }
		}
	}

	public class CreateFoodSafetyQuestionDataParameters
	{
		private FoodSafetyQuestion m_FoodSafetyQuestion;
		object[] m_Parameters;

        public CreateFoodSafetyQuestionDataParameters(FoodSafetyQuestion FoodSafetyQuestion)
		{
            this.m_FoodSafetyQuestion = FoodSafetyQuestion;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[8];
            parameters[0] = this.FoodSafetyQuestion.QuestionId;
            parameters[1] = this.FoodSafetyQuestion.Question;
            parameters[2] = this.FoodSafetyQuestion.Section;
            parameters[3] = this.FoodSafetyQuestion.Active;
            parameters[4] = this.FoodSafetyQuestion.CheckListGroupId;
            parameters[5] = this.FoodSafetyQuestion.Additional;
            parameters[6] = this.FoodSafetyQuestion.Custom;
            parameters[7] = this.FoodSafetyQuestion.SectionId;
            //parameters[7] = this.FoodSafetyQuestion.ChildQuestionId;
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
