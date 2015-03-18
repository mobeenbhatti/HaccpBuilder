using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert 
{
  public  class CreateValidationQuestion : DataAccessBase
    {
        private ValidationQuestion m_ValidationQuestion;

		public CreateValidationQuestion()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertValidationQuestionByGroupId.ToString();
		}

		public void Insert()
		{

            CreateValidationQuestionDataParameters createParameters = new CreateValidationQuestionDataParameters(this.m_ValidationQuestion);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
       

        public ValidationQuestion ValidationQuestion
		{
            get { return m_ValidationQuestion; }
            set { m_ValidationQuestion = value; }
		}
	}

	public class CreateValidationQuestionDataParameters
	{
		private ValidationQuestion m_ValidationQuestion;
		object[] m_Parameters;

        public CreateValidationQuestionDataParameters(ValidationQuestion ValidationQuestion)
		{
            this.m_ValidationQuestion = ValidationQuestion;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[6];
            parameters[0] = this.ValidationQuestion.QuestionId;
            parameters[1] = this.ValidationQuestion.Question;
            //parameters[2] = this.ValidationQuestion.Section;
            parameters[2] = this.ValidationQuestion.Active;
            parameters[3] = this.ValidationQuestion.ValidationGroupId;
            parameters[4] = this.ValidationQuestion.Additional;
            parameters[5] = this.ValidationQuestion.Custom;
            //parameters[7] = this.ValidationQuestion.SectionId;
            //parameters[7] = this.ValidationQuestion.ChildQuestionId;
            Parameters = parameters;
		}

        public ValidationQuestion ValidationQuestion
		{
            get { return m_ValidationQuestion; }
            set { m_ValidationQuestion = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
