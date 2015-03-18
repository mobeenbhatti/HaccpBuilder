using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetValidationHistory : IBusinessLogic
	{
        private ValidationHistory m_ValidationHistory;

        public ProcessSetValidationHistory()
		{
		}

		public void Invoke()
		{
            SetValidationHistory setValidationHistory = new SetValidationHistory();
            setValidationHistory.ValidationHistory = this.m_ValidationHistory;
            setValidationHistory.Update();
		}
        public void SetHistoryStatus(int nHistoryId, int nIsComplete, DateTime dtEntryDate)
        {
            SetValidationHistory setValidationHistory = new SetValidationHistory();
            setValidationHistory.UpdateStatus(nHistoryId, nIsComplete, dtEntryDate);
        }

        public ValidationHistory ValidationHistory
		{
            get { return m_ValidationHistory; }
            set { m_ValidationHistory = value; }
		}
	}
}

