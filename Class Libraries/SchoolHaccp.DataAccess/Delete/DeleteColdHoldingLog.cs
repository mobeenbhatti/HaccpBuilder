using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteColdHoldingLog : DataAccessBase
	{
        private ColdHoldingLog m_ColdHoldingLog;

		public DeleteColdHoldingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteColdHoldingLog.ToString();
		}

		public void Delete()
		{
            DeleteColdHoldingLogDataParameters createParameters = new DeleteColdHoldingLogDataParameters(this.m_ColdHoldingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public ColdHoldingLog ColdHoldingLog
		{
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
		}
	}

	public class DeleteColdHoldingLogDataParameters
	{
		private ColdHoldingLog m_ColdHoldingLog;
		object[] m_Parameters;

        public DeleteColdHoldingLogDataParameters(ColdHoldingLog ColdHoldingLog)
		{
            this.m_ColdHoldingLog = ColdHoldingLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_ColdHoldingLog.ColdHoldingLogId;           
            Parameters = parameters;
		}

        public ColdHoldingLog ColdHoldingLog
		{
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
