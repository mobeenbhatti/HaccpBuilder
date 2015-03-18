using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateProcessGroup : DataAccessBase
    {
        private ProcessGroup m_ProcessGroup;

        public CreateProcessGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertProcessGroup.ToString();
        }

        public void Insert()
        {

            CreateProcessGroupDataParameters createParameters = new CreateProcessGroupDataParameters(this.m_ProcessGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public ProcessGroup ProcessGroup
        {
            get { return m_ProcessGroup; }
            set { m_ProcessGroup = value; }
        }
    }

    public class CreateProcessGroupDataParameters
    {
        private ProcessGroup m_ProcessGroup;
        object[] m_Parameters;

        public CreateProcessGroupDataParameters(ProcessGroup ProcessGroup)
        {
            this.m_ProcessGroup = ProcessGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.ProcessGroup.DistrictId;
            parameters[1] = this.ProcessGroup.GroupName;

            Parameters = parameters;
        }

        public ProcessGroup ProcessGroup
        {
            get { return m_ProcessGroup; }
            set { m_ProcessGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
