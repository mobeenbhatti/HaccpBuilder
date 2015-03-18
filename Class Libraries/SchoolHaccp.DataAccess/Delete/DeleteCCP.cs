using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteCCP : DataAccessBase
    {
        private CCPs m_CCP;

        public DeleteCCP()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteCCPByChildId.ToString();
        }

        public void Delete()
        {

            //DeleteCCPDataParameters DeleteParameters = new DeleteCCPDataParameters(this.m_CCP);

            object[] parameters = new object[1];
            parameters[0] = this.CCP.CCPId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public CCPs CCP
        {
            get { return m_CCP; }
            set { m_CCP = value; }
        }
    }

    public class DeleteCCPDataParameters
    {
        private CCPs m_CCP;
        object[] m_Parameters;

        public DeleteCCPDataParameters(CCPs CCP)
        {
            this.m_CCP = CCP;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.CCP.CCPId;

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
