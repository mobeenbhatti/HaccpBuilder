using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateReceivingLog : DataAccessBase
    {
        private ReceivingLog m_ReceivingLog;

        public CreateReceivingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertReceivingLog.ToString();
        }

        public void Insert()
        {
            int ReceivingLogId = 0;
            CreateReceivingLogDataParameters createParameters = new CreateReceivingLogDataParameters(this.m_ReceivingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }
       

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }

    public class CreateReceivingLogDataParameters
    {
        private ReceivingLog m_ReceivingLog;
        object[] m_Parameters;

        public CreateReceivingLogDataParameters(ReceivingLog ReceivingLog)
        {
            this.m_ReceivingLog = ReceivingLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[17];
            parameters[0] = this.m_ReceivingLog.EntryDate;
            parameters[1] = this.m_ReceivingLog.VendorId;
            parameters[2] = this.m_ReceivingLog.IngredientId;
            parameters[3] = this.m_ReceivingLog.MenuItemId;
            parameters[4] = this.m_ReceivingLog.FoodItem;
            parameters[5] = this.m_ReceivingLog.Temperature;
            //parameters[6] = this.m_ReceivingLog.CorrectiveAction;
            parameters[6] = this.m_ReceivingLog.UserName;
            parameters[7] = this.m_ReceivingLog.VerifiedBy;
            parameters[8] = this.m_ReceivingLog.VerifiedDate;
            parameters[9] = this.m_ReceivingLog.KitchenId;
            parameters[10] = this.m_ReceivingLog.MealDate;
            parameters[11] = this.m_ReceivingLog.BatchNumber;
            parameters[12] = this.m_ReceivingLog.CorrectiveAction1;
            parameters[13] = this.m_ReceivingLog.TempRequired;
            parameters[14] = this.m_ReceivingLog.TempTime;
            parameters[15] = this.m_ReceivingLog.Volume;
            parameters[16] = this.m_ReceivingLog.MobileId;


            Parameters = parameters;
        }

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
