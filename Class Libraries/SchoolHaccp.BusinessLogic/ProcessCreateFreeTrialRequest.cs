using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateFreeTrialRequest : IBusinessLogic
    {
        private FreeTrialRequest m_FreeTrialRequest;

        public ProcessCreateFreeTrialRequest()
        {
        }

        public void Invoke()
        {
            CreateFreeTrialRequest createFreeTrialRequest = new CreateFreeTrialRequest();
            createFreeTrialRequest.FreeTrialRequest = this.FreeTrialRequest;
            createFreeTrialRequest.Insert();
            this.FreeTrialRequest = createFreeTrialRequest.FreeTrialRequest;
        }

        public FreeTrialRequest FreeTrialRequest
        {
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
        }
    }
}
