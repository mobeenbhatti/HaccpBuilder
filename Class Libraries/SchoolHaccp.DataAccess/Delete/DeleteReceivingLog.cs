using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteReceivingLog : DataAccessBase
	{
        private ReceivingLog m_ReceivingLog;

		public DeleteReceivingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteReceivingLog.ToString();
		}

		public void Delete()
		{
            DeleteReceivingLogDataParameters createParameters = new DeleteReceivingLogDataParameters(this.m_ReceivingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public ReceivingLog ReceivingLog
		{
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
		}
	}

	public class DeleteReceivingLogDataParameters
	{
		private ReceivingLog m_ReceivingLog;
		object[] m_Parameters;

        public DeleteReceivingLogDataParameters(ReceivingLog ReceivingLog)
		{
            this.m_ReceivingLog = ReceivingLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_ReceivingLog.ReceivingLogId;           
            Parameters = parameters;
		}

        public ReceivingLog ReceivingLog
		{
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
