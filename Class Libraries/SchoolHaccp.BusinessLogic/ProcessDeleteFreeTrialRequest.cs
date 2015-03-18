using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteFreeTrialRequest : IBusinessLogic
    {
        private FreeTrialRequest m_FreeTrialRequest;

        public ProcessDeleteFreeTrialRequest()
        {
        }

        public void Invoke()
        {
            DeleteFreeTrialRequest deleteFreeTrialRequest = new DeleteFreeTrialRequest();
            deleteFreeTrialRequest.FreeTrialRequest = this.m_FreeTrialRequest;
            deleteFreeTrialRequest.Delete();
        }

        public FreeTrialRequest FreeTrialRequest
        {
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
        }
    }
}

