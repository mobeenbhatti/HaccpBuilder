using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetCriticalLimits: DataAccessBase
	{
		private CriticalLimit  m_CriticalLimit ;

        public SetCriticalLimits()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenCriticalLimitsById.ToString();
		}

		public void Update()
		{
			SetCriticalLimitByIdDataParameters setParameters = new SetCriticalLimitByIdDataParameters(this.m_CriticalLimit );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

        public void UpdateByInclude()
        {
        }
        public void UpdateByStatus()
        {
        }

		public CriticalLimit  CriticalLimit 
		{
			get { return m_CriticalLimit ; }
			set { m_CriticalLimit  = value; }
		}
	}

	public class SetCriticalLimitByIdDataParameters
	{
		private CriticalLimit  m_CriticalLimit ;
		object[] m_Parameters;

		public SetCriticalLimitByIdDataParameters(CriticalLimit  CriticalLimit )
		{
			this.m_CriticalLimit  = CriticalLimit ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[27];
            parameters[0] = this.m_CriticalLimit.CriticalLimitID;
            parameters[1] = this.m_CriticalLimit.KitchenId;            
            parameters[2] = this.m_CriticalLimit.LogTypeID;
            parameters[3] = this.m_CriticalLimit.SCLTempHigh;
            parameters[4] = this.m_CriticalLimit.SCLTempLow;
            parameters[5] = this.m_CriticalLimit.CCLTempHigh;
            parameters[6] = this.m_CriticalLimit.CCLTempLow;
            parameters[7] = this.m_CriticalLimit.QCLTempHigh;
            parameters[8] = this.m_CriticalLimit.QCLTempLow;
            parameters[9] = this.m_CriticalLimit.SCLTime1;
            parameters[10] = this.m_CriticalLimit.SCLTime2;
            parameters[11] = this.m_CriticalLimit.CCLTime1;
            parameters[12] = this.m_CriticalLimit.CCLTime2;
            parameters[13] = this.m_CriticalLimit.QCLTime1;
            parameters[14] = this.m_CriticalLimit.QCLTime2;
            parameters[15] = this.m_CriticalLimit.SCLTempHigh1;
            parameters[16] = this.m_CriticalLimit.SCLTempLow1;
            parameters[17] = this.m_CriticalLimit.CCLTempHigh1;
            parameters[18] = this.m_CriticalLimit.CCLTempLow1;
            parameters[19] = this.m_CriticalLimit.QCLTempHigh1;
            parameters[20] = this.m_CriticalLimit.QCLTempLow1;
            parameters[21] = this.m_CriticalLimit.SCLTempHigh2;
            parameters[22] = this.m_CriticalLimit.SCLTempLow2;
            parameters[23] = this.m_CriticalLimit.CCLTempHigh2;
            parameters[24] = this.m_CriticalLimit.CCLTempLow2;
            parameters[25] = this.m_CriticalLimit.QCLTempHigh2;
            parameters[26] = this.m_CriticalLimit.QCLTempLow2;            
            Parameters = parameters;
   
		}

		public CriticalLimit  CriticalLimit 
		{
			get { return m_CriticalLimit ; }
			set { m_CriticalLimit  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}