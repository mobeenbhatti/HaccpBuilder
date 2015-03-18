using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteFreeTrialRequest : DataAccessBase
	{
        private FreeTrialRequest m_FreeTrialRequest;

		public DeleteFreeTrialRequest()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteFreeTrialRequest.ToString();
		}

		public void Delete()
		{
            DeleteFreeTrialRequestDataParameters createParameters = new DeleteFreeTrialRequestDataParameters(this.m_FreeTrialRequest);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public FreeTrialRequest FreeTrialRequest
		{
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
		}
	}

	public class DeleteFreeTrialRequestDataParameters
	{
		private FreeTrialRequest m_FreeTrialRequest;
		object[] m_Parameters;

        public DeleteFreeTrialRequestDataParameters(FreeTrialRequest FreeTrialRequest)
		{
            this.m_FreeTrialRequest = FreeTrialRequest;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_FreeTrialRequest.FreeTrialRequestId;           
            Parameters = parameters;
		}

        public FreeTrialRequest FreeTrialRequest
		{
            get { return m_FreeTrialRequest; }
            set { m_FreeTrialRequest = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
