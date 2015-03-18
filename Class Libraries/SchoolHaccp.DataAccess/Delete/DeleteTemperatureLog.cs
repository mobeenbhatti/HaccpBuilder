using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteTemperatureLog : DataAccessBase
	{
        private TemperatureLog m_TemperatureLog;

		public DeleteTemperatureLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteTemperatureLog.ToString();
		}

		public void Delete()
		{
            DeleteTemperatureLogDataParameters createParameters = new DeleteTemperatureLogDataParameters(this.m_TemperatureLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public TemperatureLog TemperatureLog
		{
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
		}
	}

	public class DeleteTemperatureLogDataParameters
	{
		private TemperatureLog m_TemperatureLog;
		object[] m_Parameters;

        public DeleteTemperatureLogDataParameters(TemperatureLog TemperatureLog)
		{
            this.m_TemperatureLog = TemperatureLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_TemperatureLog.TemperatureLogId;           
            Parameters = parameters;
		}

        public TemperatureLog TemperatureLog
		{
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
