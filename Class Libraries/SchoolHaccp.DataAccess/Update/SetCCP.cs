
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetCCP : DataAccessBase
    {
        private CCPs m_CCP;

        public SetCCP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateCCP.ToString();
        }

        public void Update()
        {
            SetCCPByIdDataParameters setParameters = new SetCCPByIdDataParameters(this.m_CCP);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.CCP.CCPId;
            parameters[1] = this.CCP.Active;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateCCPSelection", parameters);
        }

        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }
    }

    public class SetCCPByIdDataParameters
    {
        private CCPs m_CCP;
        object[] m_Parameters;

        public SetCCPByIdDataParameters(CCPs CCP)
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
            parameters[3] = this.CCP.Active;
            parameters[4] = this.CCP.CCPGroupId;
            parameters[5] = this.CCP.Additional;
            parameters[6] = this.CCP.Custom;
            parameters[7] = this.CCP.CPRequirement;
            //parameters[7] = this.CCP.ChildCCPId;
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
