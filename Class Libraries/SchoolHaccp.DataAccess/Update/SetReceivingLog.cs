using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetReceivingLog : DataAccessBase
    {
        private ReceivingLog m_ReceivingLog;

        public SetReceivingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateReceivingLog.ToString();
        }

        public void Update()
        {
            SetReceivingLogByIdDataParameters setParameters = new SetReceivingLogByIdDataParameters(this.m_ReceivingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }

    public class SetReceivingLogByIdDataParameters
    {
        private ReceivingLog m_ReceivingLog;
        object[] m_Parameters;

        public SetReceivingLogByIdDataParameters(ReceivingLog ReceivingLog)
        {
            this.m_ReceivingLog = ReceivingLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[18];
            parameters[0] = this.m_ReceivingLog.ReceivingLogId;
            parameters[1] = this.m_ReceivingLog.EntryDate;
            parameters[2] = this.m_ReceivingLog.VendorId;
            parameters[3] = this.m_ReceivingLog.IngredientId;
            parameters[4] = this.m_ReceivingLog.MenuItemId;
            parameters[5] = this.m_ReceivingLog.FoodItem;
            parameters[6] = this.m_ReceivingLog.Temperature;            
            //parameters[7] = this.m_ReceivingLog.CorrectiveAction;
            parameters[7] = this.m_ReceivingLog.UserName;
            parameters[8] = this.m_ReceivingLog.VerifiedBy;
            parameters[9] = this.m_ReceivingLog.VerifiedDate;
            parameters[10] = this.m_ReceivingLog.KitchenId;
            parameters[11] = this.m_ReceivingLog.MealDate;
            parameters[12] = this.m_ReceivingLog.BatchNumber;
            parameters[13] = this.m_ReceivingLog.CorrectiveAction1;
            parameters[14] = this.m_ReceivingLog.TempRequired;
            parameters[15] = this.m_ReceivingLog.TempTime;
            parameters[16] = this.m_ReceivingLog.Volume;
            parameters[17] = this.m_ReceivingLog.MobileId;
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
