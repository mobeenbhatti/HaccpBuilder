using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteRefrigerationLog : DataAccessBase
	{
        private RefrigerationLog m_RefrigerationLog;

		public DeleteRefrigerationLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteRefrigerationLog.ToString();
		}

		public void Delete()
		{
            DeleteRefrigerationLogDataParameters createParameters = new DeleteRefrigerationLogDataParameters(this.m_RefrigerationLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public RefrigerationLog RefrigerationLog
		{
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
		}
	}

	public class DeleteRefrigerationLogDataParameters
	{
		private RefrigerationLog m_RefrigerationLog;
		object[] m_Parameters;

        public DeleteRefrigerationLogDataParameters(RefrigerationLog RefrigerationLog)
		{
            this.m_RefrigerationLog = RefrigerationLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_RefrigerationLog.RefrigerationLogId;           
            Parameters = parameters;
		}

        public RefrigerationLog RefrigerationLog
		{
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
