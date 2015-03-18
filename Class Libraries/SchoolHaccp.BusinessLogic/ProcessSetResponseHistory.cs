using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
	public class ProcessSetResponseHistory : IBusinessLogic
	{
        private ResponseHistory m_ResponseHistory;

        public ProcessSetResponseHistory()
		{
		}

		public void Invoke()
		{
            SetResponseHistory setResponseHistory = new SetResponseHistory();
            setResponseHistory.ResponseHistory = this.m_ResponseHistory;
            setResponseHistory.Update();
		}
        public void SetHistoryStatus(int nHistoryId, int nIsComplete, DateTime dtEntryDate)
        {
            SetResponseHistory setResponseHistory = new SetResponseHistory();
            setResponseHistory.UpdateStatus(nHistoryId, nIsComplete, dtEntryDate);
        }

        public ResponseHistory ResponseHistory
		{
            get { return m_ResponseHistory; }
            set { m_ResponseHistory = value; }
		}
	}
}

