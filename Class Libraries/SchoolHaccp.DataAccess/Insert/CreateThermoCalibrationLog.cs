using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateThermoCalibrationLog : DataAccessBase
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public CreateThermoCalibrationLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertThermoCalibrationLog.ToString();
        }

        public void Insert()
        {
            int ThermoCalibrationLogId = 0;
            CreateThermoCalibrationLogDataParameters createParameters = new CreateThermoCalibrationLogDataParameters(this.m_ThermoCalibrationLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }       

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }

    public class CreateThermoCalibrationLogDataParameters
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;
        object[] m_Parameters;

        public CreateThermoCalibrationLogDataParameters(ThermoCalibrationLog ThermoCalibrationLog)
        {
            this.m_ThermoCalibrationLog = ThermoCalibrationLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[11];
            parameters[0] = this.m_ThermoCalibrationLog.EntryDate;
            //parameters[1] = this.m_ThermoCalibrationLog.Thermometer;
            parameters[1] = this.m_ThermoCalibrationLog.Temperature;
           // parameters[3] = this.m_ThermoCalibrationLog.CorrectiveAction;
            parameters[2] = this.m_ThermoCalibrationLog.UserName;
            parameters[3] = this.m_ThermoCalibrationLog.VerifiedBy;
            parameters[4] = this.m_ThermoCalibrationLog.VerifiedDate;
            parameters[5] = this.m_ThermoCalibrationLog.KitchenId;
            parameters[6] = this.m_ThermoCalibrationLog.MealDate;
            parameters[7] = this.m_ThermoCalibrationLog.Temperature2;
            parameters[8] = this.m_ThermoCalibrationLog.Temperature3;
            parameters[9] = this.m_ThermoCalibrationLog.ThermometerID;
            parameters[10] = this.m_ThermoCalibrationLog.MobileId;
          
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
