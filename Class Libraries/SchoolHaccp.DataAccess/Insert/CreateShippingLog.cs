using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateShippingLog : DataAccessBase
    {
        private ShippingLog m_ShippingLog;

        public CreateShippingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertShippingLog.ToString();
        }

        public void Insert()
        {
            int ShippingLogId = 0;
            CreateShippingLogDataParameters createParameters = new CreateShippingLogDataParameters(this.m_ShippingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }
        public void Insert(string strMode)
        {
            object[] parameters = new object[12];
            parameters[0] = this.m_ShippingLog.EntryDate;
            parameters[1] = this.m_ShippingLog.VendorId;
            parameters[2] = this.m_ShippingLog.IngredientId;
            parameters[3] = this.m_ShippingLog.MenuItemId;
            parameters[4] = this.m_ShippingLog.FoodItem;
            parameters[5] = this.m_ShippingLog.Temperature;
            parameters[6] = this.m_ShippingLog.CorrectiveAction;
            parameters[7] = int.Parse(this.m_ShippingLog.UserName);
            parameters[8] = this.m_ShippingLog.VerifiedBy;
            parameters[9] = this.m_ShippingLog.VerifiedDate;
            parameters[10] = this.m_ShippingLog.KitchenId;
            parameters[11] = this.m_ShippingLog.BatchNumber;
            DataServices dataServices = new DataServices("uspAdm_InsertShippingLogPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }

    public class CreateShippingLogDataParameters
    {
        private ShippingLog m_ShippingLog;
        object[] m_Parameters;

        public CreateShippingLogDataParameters(ShippingLog ShippingLog)
        {
            this.m_ShippingLog = ShippingLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[17];
            parameters[0] = this.m_ShippingLog.EntryDate;
            parameters[1] = this.m_ShippingLog.VendorId;
            parameters[2] = this.m_ShippingLog.IngredientId;
            parameters[3] = this.m_ShippingLog.MenuItemId;
            parameters[4] = this.m_ShippingLog.FoodItem;
            parameters[5] = this.m_ShippingLog.Temperature;
            //parameters[6] = this.m_ShippingLog.CorrectiveAction;
            parameters[6] = this.m_ShippingLog.UserName;
            parameters[7] = this.m_ShippingLog.VerifiedBy;
            parameters[8] = this.m_ShippingLog.VerifiedDate;
            parameters[9] = this.m_ShippingLog.KitchenId;
            parameters[10] = this.m_ShippingLog.MealDate;
            parameters[11] = this.m_ShippingLog.BatchNumber;
            parameters[12] = this.m_ShippingLog.CorrectiveAction1;
            parameters[13] = this.m_ShippingLog.TempRequired;
            parameters[14] = this.m_ShippingLog.TempTime;
            parameters[15] = this.m_ShippingLog.Volume;
            parameters[16] = this.m_ShippingLog.MobileId;


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
