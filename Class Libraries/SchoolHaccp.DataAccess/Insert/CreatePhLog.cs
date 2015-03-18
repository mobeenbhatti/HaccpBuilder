using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreatePhLog : DataAccessBase
    {
        private PhLog m_PhLog;

        public CreatePhLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertPhLog.ToString();
        }

        public void Insert()
        {            
            CreatePhLogDataParameters createParameters = new CreatePhLogDataParameters(this.m_PhLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }
       

        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }
    }

    public class CreatePhLogDataParameters
    {
        private PhLog m_PhLog;
        object[] m_Parameters;

        public CreatePhLogDataParameters(PhLog PhLog)
        {
            this.m_PhLog = PhLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[21];            
            parameters[0] = this.m_PhLog.EntryDate;           
            parameters[1] = this.m_PhLog.BatchNumber;
            //parameters[8] = this.m_PhLog.CorrectiveAction;
            parameters[2] = this.m_PhLog.Volume;
            parameters[3] = this.m_PhLog.PhLevel;
            parameters[4] = this.m_PhLog.PhLevelTime;
            parameters[5] = this.m_PhLog.CorrectiveActionPhLevel;
            parameters[6] = this.m_PhLog.WaterTemp;
            parameters[7] = this.m_PhLog.WaterTempTime;
            parameters[8] = this.m_PhLog.CorrectiveActionWaterTemp;
            parameters[9] = this.m_PhLog.ContactMinutes;
            parameters[10] = this.m_PhLog.ContactTime;
            parameters[11] = this.m_PhLog.CorrectiveActionContact;            
            parameters[12] = this.m_PhLog.VerifiedBy;
            parameters[13] = this.m_PhLog.VerifiedDate;
            parameters[14] = this.m_PhLog.KitchenId;
            parameters[15] = this.m_PhLog.ServiceDate;
            parameters[16] = this.m_PhLog.CorrectiveAction;
            parameters[17] = this.PhLog.ItemCategory;
            parameters[18] = this.PhLog.ItemId;
            parameters[19] = this.PhLog.UserName;
            parameters[20] = this.m_PhLog.MobileId;

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
