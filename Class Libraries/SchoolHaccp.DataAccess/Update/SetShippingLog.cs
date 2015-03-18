using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetShippingLog : DataAccessBase
    {
        private ShippingLog m_ShippingLog;

        public SetShippingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateShippingLog.ToString();
        }

        public void Update()
        {
            SetShippingLogByIdDataParameters setParameters = new SetShippingLogByIdDataParameters(this.m_ShippingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }

    public class SetShippingLogByIdDataParameters
    {
        private ShippingLog m_ShippingLog;
        object[] m_Parameters;

        public SetShippingLogByIdDataParameters(ShippingLog ShippingLog)
        {
            this.m_ShippingLog = ShippingLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[18];
            parameters[0] = this.m_ShippingLog.ShippingLogId;
            parameters[1] = this.m_ShippingLog.EntryDate;
            parameters[2] = this.m_ShippingLog.VendorId;
            parameters[3] = this.m_ShippingLog.IngredientId;
            parameters[4] = this.m_ShippingLog.MenuItemId;
            parameters[5] = this.m_ShippingLog.FoodItem;
            parameters[6] = this.m_ShippingLog.Temperature;
            //parameters[7] = this.m_ShippingLog.CorrectiveAction;
            parameters[7] = this.m_ShippingLog.UserName;
            parameters[8] = this.m_ShippingLog.VerifiedBy;
            parameters[9] = this.m_ShippingLog.VerifiedDate;
            parameters[10] = this.m_ShippingLog.KitchenId;
            parameters[11] = this.m_ShippingLog.MealDate;
            parameters[12] = this.m_ShippingLog.BatchNumber;
            parameters[13] = this.m_ShippingLog.CorrectiveAction1;
            parameters[14] = this.m_ShippingLog.TempRequired;
            parameters[15] = this.m_ShippingLog.TempTime;
            parameters[16] = this.ShippingLog.Volume;
            parameters[17]=this.m_ShippingLog.MobileId;
            Parameters = parameters;
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}

