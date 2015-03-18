using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateColdHoldingLog : DataAccessBase
	{
        private ColdHoldingLog m_ColdHoldingLog;

		public CreateColdHoldingLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertColdHoldingLog.ToString();
		}

		public void Insert()
		{
            int ColdHoldingLogId = 0;
            CreateColdHoldingLogDataParameters createParameters = new CreateColdHoldingLogDataParameters(this.m_ColdHoldingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[12];
            parameters[0] = this.m_ColdHoldingLog.EntryDate;
            parameters[1] = this.m_ColdHoldingLog.FoodItem;
            parameters[2] = this.m_ColdHoldingLog.IsCustomItem;
            parameters[3] = this.m_ColdHoldingLog.InternalTemp1;
            parameters[4] = this.m_ColdHoldingLog.Temp1Time;
            parameters[5] = this.m_ColdHoldingLog.InternalTemp2;
            parameters[6] = this.m_ColdHoldingLog.Temp2Time;
            parameters[7] = this.m_ColdHoldingLog.CorrectiveAction;
            parameters[8] = int.Parse(this.m_ColdHoldingLog.UserName);
            parameters[9] = this.m_ColdHoldingLog.VerifiedBy;
            parameters[10] = this.m_ColdHoldingLog.VerifiedDate;
            parameters[11] = this.m_ColdHoldingLog.KitchenId;
            DataServices dataServices = new DataServices("uspAdm_InsertColdHoldingLogPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public ColdHoldingLog ColdHoldingLog
		{
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
		}
	}

	public class CreateColdHoldingLogDataParameters
	{
		private ColdHoldingLog m_ColdHoldingLog;
		object[] m_Parameters;

        public CreateColdHoldingLogDataParameters(ColdHoldingLog ColdHoldingLog)
		{
            this.m_ColdHoldingLog = ColdHoldingLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[17];
            parameters[0] = this.m_ColdHoldingLog.EntryDate;
            parameters[1] = this.m_ColdHoldingLog.FoodItem;
            parameters[2] = this.m_ColdHoldingLog.IsCustomItem;
            parameters[3] = this.m_ColdHoldingLog.InternalTemp1;
            parameters[4] = this.m_ColdHoldingLog.Temp1Time;
            parameters[5] = this.m_ColdHoldingLog.InternalTemp2;
            parameters[6] = this.m_ColdHoldingLog.Temp2Time;
            //parameters[7] = this.m_ColdHoldingLog.CorrectiveAction;
            parameters[7] = this.m_ColdHoldingLog.UserName;
            parameters[8] = this.m_ColdHoldingLog.VerifiedBy;
            parameters[9] = this.m_ColdHoldingLog.VerifiedDate;
            parameters[10] = this.m_ColdHoldingLog.KitchenId;
            parameters[11] = this.m_ColdHoldingLog.MealDate;
            parameters[12] = this.m_ColdHoldingLog.IngredientId;
            parameters[13] = this.m_ColdHoldingLog.MenuItemId;
            parameters[14] = this.m_ColdHoldingLog.CorrectiveAction1;
            parameters[15] = this.m_ColdHoldingLog.CorrectiveAction2;
            parameters[16] = this.m_ColdHoldingLog.MobileId;

            Parameters = parameters;
		}

        public ColdHoldingLog ColdHoldingLog
		{
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
