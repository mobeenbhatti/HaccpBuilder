using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateCCPGroup : DataAccessBase
    {
        private CCPGroup m_CCPGroup;

        public CreateCCPGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertCCPGroup.ToString();
        }

        public void Insert()
        {

            CreateCCPGroupDataParameters createParameters = new CreateCCPGroupDataParameters(this.m_CCPGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public CCPGroup CCPGroup
        {
            get { return m_CCPGroup; }
            set { m_CCPGroup = value; }
        }
    }

    public class CreateCCPGroupDataParameters
    {
        private CCPGroup m_CCPGroup;
        object[] m_Parameters;

        public CreateCCPGroupDataParameters(CCPGroup CCPGroup)
        {
            this.m_CCPGroup = CCPGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.CCPGroup.DistrictId;
            parameters[1] = this.CCPGroup.GroupName;

            Parameters = parameters;
        }

        public CCPGroup CCPGroup
        {
            get { return m_CCPGroup; }
            set { m_CCPGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
