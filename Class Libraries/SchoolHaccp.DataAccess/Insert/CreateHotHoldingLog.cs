using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateHotHoldingLog : DataAccessBase
	{
        private HotHoldingLog m_HotHoldingLog;

		public CreateHotHoldingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertHotHoldingLog.ToString();
		}

		public void Insert()
		{
            int HotHoldingLogId = 0;
            CreateHotHoldingLogDataParameters createParameters = new CreateHotHoldingLogDataParameters(this.m_HotHoldingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[12];
            parameters[0] = this.m_HotHoldingLog.EntryDate;
            parameters[1] = this.m_HotHoldingLog.FoodItem;
            parameters[2] = this.m_HotHoldingLog.IsCustomItem;
            parameters[3] = this.m_HotHoldingLog.InternalTemp1;
            parameters[4] = this.m_HotHoldingLog.Temp1Time;
            parameters[5] = this.m_HotHoldingLog.InternalTemp2;
            parameters[6] = this.m_HotHoldingLog.Temp2Time;
            parameters[7] = this.m_HotHoldingLog.CorrectiveAction;
            parameters[8] = int.Parse(this.m_HotHoldingLog.UserName);
            parameters[9] = this.m_HotHoldingLog.VerifiedBy;
            parameters[10] = this.m_HotHoldingLog.VerifiedDate;
            parameters[11] = this.m_HotHoldingLog.KitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertHotHoldingLogPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public HotHoldingLog HotHoldingLog
		{
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
		}
	}

	public class CreateHotHoldingLogDataParameters
	{
		private HotHoldingLog m_HotHoldingLog;
		object[] m_Parameters;

        public CreateHotHoldingLogDataParameters(HotHoldingLog HotHoldingLog)
		{
            this.m_HotHoldingLog = HotHoldingLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[17];
            parameters[0] = this.m_HotHoldingLog.EntryDate;
            parameters[1] = this.m_HotHoldingLog.FoodItem;
            parameters[2] = this.m_HotHoldingLog.IsCustomItem;
            parameters[3] = this.m_HotHoldingLog.InternalTemp1;
            parameters[4] = this.m_HotHoldingLog.Temp1Time;
            parameters[5] = this.m_HotHoldingLog.InternalTemp2;
            parameters[6] = this.m_HotHoldingLog.Temp2Time;
            //parameters[7] = this.m_HotHoldingLog.CorrectiveAction;
            parameters[7] = this.m_HotHoldingLog.UserName;
            parameters[8] = this.m_HotHoldingLog.VerifiedBy;
            parameters[9] = this.m_HotHoldingLog.VerifiedDate;
            parameters[10] = this.m_HotHoldingLog.KitchenId;
            parameters[11] = this.m_HotHoldingLog.MealDate;
            parameters[12] = this.m_HotHoldingLog.IngredientId;
            parameters[13] = this.m_HotHoldingLog.MenuItemId;
            parameters[14] = this.m_HotHoldingLog.CorrectiveAction1;
            parameters[15] = this.m_HotHoldingLog.CorrectiveAction2;
            parameters[16] = this.m_HotHoldingLog.MobileId;

            Parameters = parameters;
		}

        public HotHoldingLog HotHoldingLog
		{
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
