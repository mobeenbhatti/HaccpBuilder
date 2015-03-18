
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateFreezerLog : DataAccessBase
	{
        private FreezerLog m_FreezerLog;

		public CreateFreezerLog()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertFreezerLog.ToString();
		}

		public void Insert()
		{
            int FreezerLogId = 0;
            CreateFreezerLogDataParameters createParameters = new CreateFreezerLogDataParameters(this.m_FreezerLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[20];
            parameters[0] = this.m_FreezerLog.EntryDate;
            parameters[1] = this.m_FreezerLog.FoodItem;
            parameters[2] = this.m_FreezerLog.IsCustomItem;
            parameters[3] = this.m_FreezerLog.Temp1;
            parameters[4] = this.m_FreezerLog.Temp1Time;
            parameters[5] = this.m_FreezerLog.Temp2;
            parameters[6] = this.m_FreezerLog.Temp2Time;
            parameters[7] = this.m_FreezerLog.Temp3;
            parameters[8] = this.m_FreezerLog.Temp3Time;
            //parameters[9] = this.m_FreezerLog.Temp4;
            //parameters[10] = this.m_FreezerLog.Temp4Time;
            //parameters[11] = this.m_FreezerLog.Temp5;
            //parameters[12] = this.m_FreezerLog.Temp5Time;
            //parameters[13] = this.m_FreezerLog.Temp6;
            //parameters[14] = this.m_FreezerLog.Temp6Time;
            //parameters[15] = this.m_FreezerLog.CorrectiveAction;
            parameters[9] = int.Parse(this.m_FreezerLog.UserName);
            parameters[10] = this.m_FreezerLog.VerifiedBy;
            parameters[11] = this.m_FreezerLog.VerifiedDate;
            parameters[12] = this.m_FreezerLog.KitchenId;
            parameters[13] = this.m_FreezerLog.CorrectiveAction1;
            parameters[14] = this.m_FreezerLog.CorrectiveAction2;
            parameters[15] = this.m_FreezerLog.CorrectiveAction3;
            DataServices dataServices = new DataServices("uspAdm_InsertFreezerLogPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }


        public FreezerLog FreezerLog
		{
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
		}
	}

	public class CreateFreezerLogDataParameters
	{
		private FreezerLog m_FreezerLog;
		object[] m_Parameters;

        public CreateFreezerLogDataParameters(FreezerLog FreezerLog)
		{
            this.m_FreezerLog = FreezerLog;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[20];
            parameters[0] = this.m_FreezerLog.EntryDate;
            parameters[1] = this.m_FreezerLog.FoodItem;
            parameters[2] = this.m_FreezerLog.IsCustomItem;
            parameters[3] = this.m_FreezerLog.Temp1;
            parameters[4] = this.m_FreezerLog.Temp1Time;
            parameters[5] = this.m_FreezerLog.Temp2;
            parameters[6] = this.m_FreezerLog.Temp2Time;
            parameters[7] = this.m_FreezerLog.Temp3;
            parameters[8] = this.m_FreezerLog.Temp3Time;
            //parameters[9] = this.m_FreezerLog.Temp4;
            //parameters[10] = this.m_FreezerLog.Temp4Time;
            //parameters[11] = this.m_FreezerLog.Temp5;
            //parameters[12] = this.m_FreezerLog.Temp5Time;
            //parameters[13] = this.m_FreezerLog.Temp6;
            //parameters[14] = this.m_FreezerLog.Temp6Time;
            //parameters[15] = this.m_FreezerLog.CorrectiveAction;
            parameters[9] = this.m_FreezerLog.UserName;
            parameters[10] = this.m_FreezerLog.VerifiedBy;
            parameters[11] = this.m_FreezerLog.VerifiedDate;
            parameters[12] = this.m_FreezerLog.KitchenId;
            parameters[13] = this.m_FreezerLog.MealDate;
            parameters[14] = this.m_FreezerLog.IngredientId;
            parameters[15] = this.m_FreezerLog.MenuItemId;
            parameters[16] = this.m_FreezerLog.CorrectiveAction1;
            parameters[17] = this.m_FreezerLog.CorrectiveAction2;
            parameters[18] = this.m_FreezerLog.CorrectiveAction3;
            parameters[19] = this.m_FreezerLog.MobileId;
            Parameters = parameters;
		}

        public FreezerLog FreezerLog
		{
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
