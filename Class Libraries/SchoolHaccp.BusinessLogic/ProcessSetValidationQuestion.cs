using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetValidationQuestion : IBusinessLogic
    {
        private ValidationQuestion m_ValidationQuestion;

        public ProcessSetValidationQuestion()
        {
        }

        public void Invoke()
        {
            SetValidationQuestion setValidationQuestion = new SetValidationQuestion();
            setValidationQuestion.ValidationQuestion = this.m_ValidationQuestion;
            setValidationQuestion.Update();
        }
        public void ValidationQuestionSelection()
        {
            SetValidationQuestion setValidationQuestion = new SetValidationQuestion();
            setValidationQuestion.ValidationQuestion = this.m_ValidationQuestion;
            setValidationQuestion.UpdateSelection();
        }

        public ValidationQuestion ValidationQuestion
        {
            get { return m_ValidationQuestion; }
            set { m_ValidationQuestion = value; }
        }
    }
}
