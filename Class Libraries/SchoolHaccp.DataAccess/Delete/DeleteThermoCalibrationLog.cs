using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
	public class DeleteThermoCalibrationLog : DataAccessBase
	{
        private ThermoCalibrationLog m_ThermoCalibrationLog;

		public DeleteThermoCalibrationLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteThermoCalibrationLog.ToString();
		}

		public void Delete()
		{
            DeleteThermoCalibrationLogDataParameters createParameters = new DeleteThermoCalibrationLogDataParameters(this.m_ThermoCalibrationLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
		}

        public ThermoCalibrationLog ThermoCalibrationLog
		{
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
		}
	}

	public class DeleteThermoCalibrationLogDataParameters
	{
		private ThermoCalibrationLog m_ThermoCalibrationLog;
		object[] m_Parameters;

        public DeleteThermoCalibrationLogDataParameters(ThermoCalibrationLog ThermoCalibrationLog)
		{
            this.m_ThermoCalibrationLog = ThermoCalibrationLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];
            parameters[0] = this.m_ThermoCalibrationLog.ThermoCalibrationLogId;           
            Parameters = parameters;
		}

        public ThermoCalibrationLog ThermoCalibrationLog
		{
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
