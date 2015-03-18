using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateValidationHistory : IBusinessLogic
    {
        private ValidationHistory m_ValidationHistory;

        public ProcessCreateValidationHistory()
        {
        }

        public void Invoke()
        {
            CreateValidationHistory createValidationHistory = new CreateValidationHistory();
            createValidationHistory.ValidationHistory = this.m_ValidationHistory;
            createValidationHistory.Insert();
            this.m_ValidationHistory = createValidationHistory.ValidationHistory;
        }

        public ValidationHistory ValidationHistory
        {
            get { return m_ValidationHistory; }
            set { m_ValidationHistory = value; }
        }
    }
}



