
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetFreezerNewLog : DataAccessBase
    {
        private FreezerNewLog m_FreezerNewLog;

        public SetFreezerNewLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateFreezerNewLog.ToString();
        }

        public void Update()
        {
            SetFreezerNewLogByIdDataParameters setParameters = new SetFreezerNewLogByIdDataParameters(this.m_FreezerNewLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }

    public class SetFreezerNewLogByIdDataParameters
    {
        private FreezerNewLog m_FreezerNewLog;
        object[] m_Parameters;

        public SetFreezerNewLogByIdDataParameters(FreezerNewLog FreezerNewLog)
        {
            this.m_FreezerNewLog = FreezerNewLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[12];
            parameters[0] = this.m_FreezerNewLog.FreezerNewLogId;
            parameters[1] = this.m_FreezerNewLog.EntryDate;
           // parameters[2] = this.m_RefrigerationLog.Location;
            parameters[2] = this.m_FreezerNewLog.Temperature;
            //parameters[4] = this.m_RefrigerationLog.CorrectiveAction;
            parameters[3] = this.m_FreezerNewLog.UserName;
            parameters[4] = this.m_FreezerNewLog.VerifiedBy;
            parameters[5] = this.m_FreezerNewLog.VerifiedDate;
            parameters[6] = this.m_FreezerNewLog.KitchenId;
            parameters[7] = this.m_FreezerNewLog.MealDate;
            parameters[8] = this.m_FreezerNewLog.CorrectiveAction1;
            parameters[9] = this.m_FreezerNewLog.FreezerNewLogDevice;
            parameters[10] = this.m_FreezerNewLog.TempTime;
            parameters[11] = this.m_FreezerNewLog.MobileId;
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

