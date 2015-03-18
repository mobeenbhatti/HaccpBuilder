using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateCCP : DataAccessBase
    {
        private CCPs m_CCP;

        public CreateCCP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertCCPByGroupId.ToString();
        }

        public void Insert()
        {

            CreateCCPDataParameters createParameters = new CreateCCPDataParameters(this.m_CCP);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }
    }

    public class CreateCCPDataParameters
    {
        private CCPs m_CCP;
        object[] m_Parameters;

        public CreateCCPDataParameters(CCPs CCP)
        {
            this.m_CCP = CCP;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[8];
            parameters[0] = this.CCP.CCPId;
            parameters[1] = this.CCP.CCP;
            parameters[2] = this.CCP.Requirement;
            parameters[3] = this.CCP.CCPGroupId;
            parameters[4] = this.CCP.Additional;
            parameters[5] = this.CCP.Active;
            parameters[6] = this.CCP.Custom;
            parameters[7] = this.CCP.CPRequirement;
            Parameters = parameters;
        }

        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
