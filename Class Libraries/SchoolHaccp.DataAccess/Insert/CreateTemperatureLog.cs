
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateTemperatureLog : DataAccessBase
	{
        private TemperatureLog m_TemperatureLog;

		public CreateTemperatureLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertTemperatureLog.ToString();
		}

		public void Insert()
		{
            int TemperatureLogId = 0;
            CreateTemperatureLogDataParameters createParameters = new CreateTemperatureLogDataParameters(this.m_TemperatureLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}       

        public TemperatureLog TemperatureLog
		{
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
		}
	}

	public class CreateTemperatureLogDataParameters
	{
		private TemperatureLog m_TemperatureLog;
		object[] m_Parameters;

        public CreateTemperatureLogDataParameters(TemperatureLog TemperatureLog)
		{
            this.m_TemperatureLog = TemperatureLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[19];
            parameters[0] = this.m_TemperatureLog.EntryDate;
            parameters[1] = this.m_TemperatureLog.FoodItem;
            parameters[2] = this.m_TemperatureLog.IsCustomItem;
            parameters[3] = this.m_TemperatureLog.InternalTemp1;
            parameters[4] = this.m_TemperatureLog.Temp1Time;
            parameters[5] = this.m_TemperatureLog.InternalTemp2;
            parameters[6] = this.m_TemperatureLog.Temp2Time;
            parameters[7] = this.m_TemperatureLog.CorrectiveAction;
            parameters[8] = this.m_TemperatureLog.UserName;
            parameters[9] = this.m_TemperatureLog.VerifiedBy;
            parameters[10] = this.m_TemperatureLog.VerifiedDate;
            parameters[11] = this.m_TemperatureLog.KitchenId;
            parameters[12] = this.m_TemperatureLog.MealDate;
            parameters[13] = this.m_TemperatureLog.IngredientId;
            parameters[14] = this.m_TemperatureLog.MenuItemId;
            parameters[15] = this.m_TemperatureLog.CorrectiveAction1;
            parameters[16] = this.m_TemperatureLog.CorrectiveAction2;
            parameters[17] = this.m_TemperatureLog.MobileId;
            parameters[18] = this.m_TemperatureLog.BatchNo;
            Parameters = parameters;
		}

        public TemperatureLog TemperatureLog
		{
            get { return m_TemperatureLog; }
            set { m_TemperatureLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
