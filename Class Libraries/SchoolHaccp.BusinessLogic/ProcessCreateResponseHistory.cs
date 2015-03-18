using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateResponseHistory : IBusinessLogic
    {
        private ResponseHistory m_ResponseHistory;

        public ProcessCreateResponseHistory()
        {
        }

        public void Invoke()
        {
            CreateResponseHistory createResponseHistory = new CreateResponseHistory();
            createResponseHistory.ResponseHistory = this.m_ResponseHistory;
            createResponseHistory.Insert();
            this.m_ResponseHistory = createResponseHistory.ResponseHistory;
        }

        public ResponseHistory ResponseHistory
        {
            get { return m_ResponseHistory; }
            set { m_ResponseHistory = value; }
        }
    }
}



