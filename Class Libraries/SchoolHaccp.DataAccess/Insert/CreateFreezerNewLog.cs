using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateFreezerNewLog : DataAccessBase
    {
        private FreezerNewLog m_FreezerNewLog;

        public CreateFreezerNewLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertFreezerNewLog.ToString();
        }

        public void Insert()
        {
            int FreezerNewLogLogId = 0;
            CreateFreezerNewLogDataParameters createParameters = new CreateFreezerNewLogDataParameters(this.m_FreezerNewLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }
        public void Insert(string strMode)
        {
            object[] parameters = new object[8];
            parameters[0] = this.m_FreezerNewLog.EntryDate;
            parameters[1] = this.m_FreezerNewLog.Location;
            parameters[2] = this.m_FreezerNewLog.Temperature;
            //parameters[3] = this.m_RefrigerationLog.CorrectiveAction;
            parameters[3] = int.Parse(this.m_FreezerNewLog.UserName);
            parameters[4] = this.m_FreezerNewLog.VerifiedBy;
            parameters[5] = this.m_FreezerNewLog.VerifiedDate;
            parameters[6] = this.m_FreezerNewLog.KitchenId;
            parameters[7] = this.m_FreezerNewLog.CorrectiveAction1;
            DataServices dataServices = new DataServices("uspAdm_InsertFreezerNewLogPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }

    public class CreateFreezerNewLogDataParameters
    {
        private FreezerNewLog m_FreezerNewLog;
        object[] m_Parameters;

        public CreateFreezerNewLogDataParameters(FreezerNewLog FreezerNewLog)
        {
            this.m_FreezerNewLog = FreezerNewLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[11];
            parameters[0] = this.m_FreezerNewLog.EntryDate;
           // parameters[1] = this.m_RefrigerationLog.Location;
            parameters[1] = this.m_FreezerNewLog.Temperature;
            //parameters[3] = this.m_RefrigerationLog.CorrectiveAction;
            parameters[2] = this.m_FreezerNewLog.UserName;
            parameters[3] = this.m_FreezerNewLog.VerifiedBy;
            parameters[4] = this.m_FreezerNewLog.VerifiedDate;
            parameters[5] = this.m_FreezerNewLog.KitchenId;
            parameters[6] = this.m_FreezerNewLog.MealDate;
            parameters[7] = this.m_FreezerNewLog.CorrectiveAction1;
            parameters[8] = this.m_FreezerNewLog.FreezerNewLogDevice;
            parameters[9] = this.m_FreezerNewLog.TempTime;
            parameters[10] = this.m_FreezerNewLog.MobileId;
            //parameters[10] = this.m_RefrigerationLog.MenuItemId;

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
