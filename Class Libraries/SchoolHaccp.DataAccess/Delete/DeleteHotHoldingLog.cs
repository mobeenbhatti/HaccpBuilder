using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteHotHoldingLog : DataAccessBase
	{
        private HotHoldingLog m_HotHoldingLog;

		public DeleteHotHoldingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteHotHoldingLog.ToString();
		}

		public void Delete()
		{
            DeleteHotHoldingLogDataParameters createParameters = new DeleteHotHoldingLogDataParameters(this.m_HotHoldingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public HotHoldingLog HotHoldingLog
		{
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
		}
	}

	public class DeleteHotHoldingLogDataParameters
	{
		private HotHoldingLog m_HotHoldingLog;
		object[] m_Parameters;

        public DeleteHotHoldingLogDataParameters(HotHoldingLog HotHoldingLog)
		{
            this.m_HotHoldingLog = HotHoldingLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_HotHoldingLog.HotHoldingLogId;           
            Parameters = parameters;
		}

        public HotHoldingLog HotHoldingLog
		{
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
