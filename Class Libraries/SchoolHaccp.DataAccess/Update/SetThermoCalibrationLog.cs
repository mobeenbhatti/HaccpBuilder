using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetThermoCalibrationLog : DataAccessBase
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;

        public SetThermoCalibrationLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateThermoCalibrationLog.ToString();
        }

        public void Update()
        {
            SetThermoCalibrationLogByIdDataParameters setParameters = new SetThermoCalibrationLogByIdDataParameters(this.m_ThermoCalibrationLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public ThermoCalibrationLog ThermoCalibrationLog
        {
            get { return m_ThermoCalibrationLog; }
            set { m_ThermoCalibrationLog = value; }
        }
    }

    public class SetThermoCalibrationLogByIdDataParameters
    {
        private ThermoCalibrationLog m_ThermoCalibrationLog;
        object[] m_Parameters;

        public SetThermoCalibrationLogByIdDataParameters(ThermoCalibrationLog ThermoCalibrationLog)
        {
            this.m_ThermoCalibrationLog = ThermoCalibrationLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[12];
            parameters[0] = this.m_ThermoCalibrationLog.ThermoCalibrationLogId;
            parameters[1] = this.m_ThermoCalibrationLog.EntryDate;
            //parameters[2] = this.m_ThermoCalibrationLog.Thermometer;
            parameters[2] = this.m_ThermoCalibrationLog.Temperature;            
          // parameters[4] = this.m_ThermoCalibrationLog.CorrectiveAction;
            parameters[3] = this.m_ThermoCalibrationLog.UserName;
            parameters[4] = this.m_ThermoCalibrationLog.VerifiedBy;
            parameters[5] = this.m_ThermoCalibrationLog.VerifiedDate;
            parameters[6] = this.m_ThermoCalibrationLog.KitchenId;
            parameters[7] = this.m_ThermoCalibrationLog.MealDate;
            parameters[8] = this.m_ThermoCalibrationLog.Temperature2;
            parameters[9] = this.m_ThermoCalibrationLog.Temperature3;
            parameters[10] = this.m_ThermoCalibrationLog.ThermometerID;
            parameters[11] = this.m_ThermoCalibrationLog.MobileId;
           
            //parameters[9] = this.m_ThermoCalibrationLog.Week;
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
