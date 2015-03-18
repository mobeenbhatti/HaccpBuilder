using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteFreezerLog : DataAccessBase
	{
        private FreezerLog m_FreezerLog;

		public DeleteFreezerLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteFreezerLog.ToString();
		}

		public void Delete()
		{
            DeleteFreezerLogDataParameters createParameters = new DeleteFreezerLogDataParameters(this.m_FreezerLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public FreezerLog FreezerLog
		{
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
		}
	}

	public class DeleteFreezerLogDataParameters
	{
		private FreezerLog m_FreezerLog;
		object[] m_Parameters;

        public DeleteFreezerLogDataParameters(FreezerLog FreezerLog)
		{
            this.m_FreezerLog = FreezerLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_FreezerLog.FreezerLogId;           
            Parameters = parameters;
		}

        public FreezerLog FreezerLog
		{
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
