using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateRefrigerationLog : DataAccessBase
    {
        private RefrigerationLog m_RefrigerationLog;

        public CreateRefrigerationLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertRefrigerationLog.ToString();
        }

        public void Insert()
        {
            int RefrigerationLogId = 0;
            CreateRefrigerationLogDataParameters createParameters = new CreateRefrigerationLogDataParameters(this.m_RefrigerationLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }      

        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }

    public class CreateRefrigerationLogDataParameters
    {
        private RefrigerationLog m_RefrigerationLog;
        object[] m_Parameters;

        public CreateRefrigerationLogDataParameters(RefrigerationLog RefrigerationLog)
        {
            this.m_RefrigerationLog = RefrigerationLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[11];
            parameters[0] = this.m_RefrigerationLog.EntryDate;
           // parameters[1] = this.m_RefrigerationLog.Location;
            parameters[1] = this.m_RefrigerationLog.Temperature;
            //parameters[3] = this.m_RefrigerationLog.CorrectiveAction;
            parameters[2] = this.m_RefrigerationLog.UserName;
            parameters[3] = this.m_RefrigerationLog.VerifiedBy;
            parameters[4] = this.m_RefrigerationLog.VerifiedDate;
            parameters[5] = this.m_RefrigerationLog.KitchenId;
            parameters[6] = this.m_RefrigerationLog.MealDate;
            parameters[7] = this.m_RefrigerationLog.CorrectiveAction1;
            parameters[8] = this.m_RefrigerationLog.RefrigerationDevice;
            parameters[9] = this.m_RefrigerationLog.TempTime;
            parameters[10] = this.m_RefrigerationLog.MobileId;
            //parameters[10] = this.m_RefrigerationLog.MenuItemId;

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
