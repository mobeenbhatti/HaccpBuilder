using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetRefrigerationLog : DataAccessBase
    {
        private RefrigerationLog m_RefrigerationLog;

        public SetRefrigerationLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateRefrigerationLog.ToString();
        }

        public void Update()
        {
            SetRefrigerationLogByIdDataParameters setParameters = new SetRefrigerationLogByIdDataParameters(this.m_RefrigerationLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }

    public class SetRefrigerationLogByIdDataParameters
    {
        private RefrigerationLog m_RefrigerationLog;
        object[] m_Parameters;

        public SetRefrigerationLogByIdDataParameters(RefrigerationLog RefrigerationLog)
        {
            this.m_RefrigerationLog = RefrigerationLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[12];
            parameters[0] = this.m_RefrigerationLog.RefrigerationLogId;
            parameters[1] = this.m_RefrigerationLog.EntryDate;
           // parameters[2] = this.m_RefrigerationLog.Location;
            parameters[2] = this.m_RefrigerationLog.Temperature;
            //parameters[4] = this.m_RefrigerationLog.CorrectiveAction;
            parameters[3] = this.m_RefrigerationLog.UserName;
            parameters[4] = this.m_RefrigerationLog.VerifiedBy;
            parameters[5] = this.m_RefrigerationLog.VerifiedDate;
            parameters[6] = this.m_RefrigerationLog.KitchenId;
            parameters[7] = this.m_RefrigerationLog.MealDate;
            parameters[8] = this.m_RefrigerationLog.CorrectiveAction1;
            parameters[9] = this.m_RefrigerationLog.RefrigerationDevice;
            parameters[10] = this.m_RefrigerationLog.TempTime;
            parameters[11] = this.m_RefrigerationLog.MobileId;
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
