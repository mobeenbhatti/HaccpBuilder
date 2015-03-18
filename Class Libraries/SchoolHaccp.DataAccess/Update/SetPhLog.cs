using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetPhLog : DataAccessBase
    {
        private PhLog  m_PhLog ;

		public SetPhLog()
		{
			base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdatePhLog.ToString();
		}

		public void Update()
		{
			SetPhLogByIdDataParameters setParameters = new SetPhLogByIdDataParameters(this.m_PhLog );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

		public PhLog  PhLog 
		{
			get { return m_PhLog ; }
			set { m_PhLog  = value; }
		}
	}

	public class SetPhLogByIdDataParameters
	{
		private PhLog  m_PhLog ;
		object[] m_Parameters;

		public SetPhLogByIdDataParameters(PhLog  PhLog )
		{
			this.m_PhLog  = PhLog ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[22];
            parameters[0] = this.m_PhLog.PhLogId;
            parameters[1] = this.m_PhLog.EntryDate;           
            parameters[2] = this.m_PhLog.BatchNumber;            
            parameters[3] = this.m_PhLog.Volume;
            parameters[4] = this.m_PhLog.PhLevel;
            parameters[5] = this.m_PhLog.PhLevelTime;
            parameters[6] = this.m_PhLog.CorrectiveActionPhLevel;
            parameters[7] = this.m_PhLog.WaterTemp;
            parameters[8] = this.m_PhLog.WaterTempTime;
            parameters[9] = this.m_PhLog.CorrectiveActionWaterTemp;
            parameters[10] = this.m_PhLog.ContactMinutes;
            parameters[11] = this.m_PhLog.ContactTime;
            parameters[12] = this.m_PhLog.CorrectiveActionContact;           
            parameters[13] = this.m_PhLog.VerifiedBy;
            parameters[14] = this.m_PhLog.VerifiedDate;
            parameters[15] = this.m_PhLog.KitchenId;
            parameters[16] = this.m_PhLog.ServiceDate;
            parameters[17] = this.m_PhLog.CorrectiveAction;
            parameters[18] = this.PhLog.ItemCategory;
            parameters[19] = this.PhLog.ItemId;
            parameters[20] = this.PhLog.UserName;
            parameters[21] = this.m_PhLog.MobileId;
            Parameters = parameters;

            
		}

		public PhLog  PhLog 
		{
			get { return m_PhLog ; }
			set { m_PhLog  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
    }
}
