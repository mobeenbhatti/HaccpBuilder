using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateCtpatGroup : DataAccessBase
    {
        private CtpatGroup m_CtpatGroup;

        public CreateCtpatGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertCtpatGroup.ToString();
        }

        public void Insert()
        {

            CreateCtpatGroupDataParameters createParameters = new CreateCtpatGroupDataParameters(this.m_CtpatGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public CtpatGroup CtpatGroup
        {
            get { return m_CtpatGroup; }
            set { m_CtpatGroup = value; }
        }
    }

    public class CreateCtpatGroupDataParameters
    {
        private CtpatGroup m_CtpatGroup;
        object[] m_Parameters;

        public CreateCtpatGroupDataParameters(CtpatGroup CtpatGroup)
        {
            this.m_CtpatGroup = CtpatGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.CtpatGroup.DistrictId;
            parameters[1] = this.CtpatGroup.GroupName;

            Parameters = parameters;
        }

        public CtpatGroup CtpatGroup
        {
            get { return m_CtpatGroup; }
            set { m_CtpatGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
