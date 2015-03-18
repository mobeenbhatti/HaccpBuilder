using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Insert
{
   public class CreateCriticalLimits: DataAccessBase
    {
        private CriticalLimit m_CriticalLimit;

        public CreateCriticalLimits()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenCriticalLimitsByKitchenId.ToString();
        }

        public void Insert()
        {

            CreateCriticalLimitDataParameters createParameters = new CreateCriticalLimitDataParameters(this.m_CriticalLimit);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public CriticalLimit CriticalLimit
        {
            get { return m_CriticalLimit; }
            set { m_CriticalLimit = value; }
        }
    }

    public class CreateCriticalLimitDataParameters
    {
        private CriticalLimit m_CriticalLimit;
        object[] m_Parameters;

        public CreateCriticalLimitDataParameters(CriticalLimit CriticalLimit)
        {
            this.m_CriticalLimit = CriticalLimit;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[8];            
            parameters[0] = this.m_CriticalLimit.KitchenId;            
            parameters[1] = this.m_CriticalLimit.LogTypeID;
            parameters[2] = this.m_CriticalLimit.SCLTempHigh;
            parameters[3] = this.m_CriticalLimit.SCLTempLow;
            parameters[4] = this.m_CriticalLimit.CCLTempHigh;
            parameters[5] = this.m_CriticalLimit.CCLTempLow;
            parameters[6] = this.m_CriticalLimit.QCLTempHigh;
            parameters[7] = this.m_CriticalLimit.QCLTempLow;
            parameters[8] = this.m_CriticalLimit.SCLTime1;
            parameters[9] = this.m_CriticalLimit.SCLTime2;
            parameters[10] = this.m_CriticalLimit.CCLTime1;
            parameters[11] = this.m_CriticalLimit.CCLTime2;
            parameters[12] = this.m_CriticalLimit.QCLTime1;
            parameters[13] = this.m_CriticalLimit.QCLTime2;
            Parameters = parameters;
           
        }

        public CriticalLimit CriticalLimit
        {
            get { return m_CriticalLimit; }
            set { m_CriticalLimit = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
