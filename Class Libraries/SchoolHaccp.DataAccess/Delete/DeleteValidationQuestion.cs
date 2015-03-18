using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteValidationQuestion : DataAccessBase
    {
        private ValidationQuestion m_ValidationQuestion;

		public DeleteValidationQuestion()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteValidationQuestionById.ToString();
		}

		public void Delete()
		{

            //DeleteValidationQuestionDataParameters DeleteParameters = new DeleteValidationQuestionDataParameters(this.m_ValidationQuestion);
            
            object[] parameters = new object[1];
            parameters[0] = this.ValidationQuestion.QuestionId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters); 
           
		}

        public ValidationQuestion ValidationQuestion
		{
            get { return m_ValidationQuestion; }
            set { m_ValidationQuestion = value; }
		}
	}

	public class DeleteValidationQuestionDataParameters
	{
		private ValidationQuestion m_ValidationQuestion;
		object[] m_Parameters;

        public DeleteValidationQuestionDataParameters(ValidationQuestion ValidationQuestion)
		{
            this.m_ValidationQuestion = ValidationQuestion;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];            
            parameters[0] = this.ValidationQuestion.QuestionId;
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
