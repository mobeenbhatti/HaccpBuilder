using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteValidationQuestion : IBusinessLogic
    {
        private ValidationQuestion m_ValidationQuestion;

        public ProcessDeleteValidationQuestion()
        {
        }

        public void Invoke()
        {
            DeleteValidationQuestion deleteValidationQuestion = new DeleteValidationQuestion();
            deleteValidationQuestion.ValidationQuestion = this.m_ValidationQuestion;
            deleteValidationQuestion.Delete();
        }

        public ValidationQuestion ValidationQuestion
        {
            get { return m_ValidationQuestion; }
            set { m_ValidationQuestion = value; }
        }
    }
}

