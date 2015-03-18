using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateValidationQuestion : IBusinessLogic
    {
        private ValidationQuestion m_ValidationQuestion;

        public ProcessCreateValidationQuestion()
        {
        }

        public void Invoke()
        {
            CreateValidationQuestion createValidationQuestion = new CreateValidationQuestion();
            createValidationQuestion.ValidationQuestion = this.m_ValidationQuestion;
            createValidationQuestion.Insert();
            this.m_ValidationQuestion = createValidationQuestion.ValidationQuestion;
        }       

        public ValidationQuestion ValidationQuestion
        {
            get { return m_ValidationQuestion; }
            set { m_ValidationQuestion = value; }
        }
    }
}
