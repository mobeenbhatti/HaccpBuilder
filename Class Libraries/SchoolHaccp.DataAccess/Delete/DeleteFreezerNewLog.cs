using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteFreezerNewLog : DataAccessBase
	{
        private FreezerNewLog m_FreezerNewLog;

		public DeleteFreezerNewLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteFreezerNewLog.ToString();
		}

		public void Delete()
		{
            DeleteFreezerNewLogDataParameters createParameters = new DeleteFreezerNewLogDataParameters(this.m_FreezerNewLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public FreezerNewLog FreezerNewLog
		{
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
		}
	}

	public class DeleteFreezerNewLogDataParameters
	{
		private FreezerNewLog m_FreezerNewLog;
		object[] m_Parameters;

        public DeleteFreezerNewLogDataParameters(FreezerNewLog FreezerNewLog)
		{
            this.m_FreezerNewLog = FreezerNewLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_FreezerNewLog.FreezerNewLogId;           
            Parameters = parameters;
		}

        public FreezerNewLog FreezerNewLog
		{
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
