using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeletePhLog:DataAccessBase
    {
         private PhLog m_PhLog;

		public DeletePhLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeletePhLog.ToString();
		}

		public void Delete()
		{
            DeletePhLogDataParameters createParameters = new DeletePhLogDataParameters(this.m_PhLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public PhLog PhLog
		{
            get { return m_PhLog; }
            set { m_PhLog = value; }
		}
	}

	public class DeletePhLogDataParameters
	{
		private PhLog m_PhLog;
		object[] m_Parameters;

        public DeletePhLogDataParameters(PhLog PhLog)
		{
            this.m_PhLog = PhLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_PhLog.PhLogId;           
            Parameters = parameters;
		}

        public PhLog PhLog
		{
            get { return m_PhLog; }
            set { m_PhLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
