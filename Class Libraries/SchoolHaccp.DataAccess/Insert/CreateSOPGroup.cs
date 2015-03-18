using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert 
{
  public  class CreateSOPGroup : DataAccessBase
    {
        private SOPGroup m_SOPGroup;

		public CreateSOPGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertSOPGroup.ToString();
		}

		public void Insert()
		{

            CreateSOPGroupDataParameters createParameters = new CreateSOPGroupDataParameters(this.m_SOPGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public SOPGroup SOPGroup
		{
            get { return m_SOPGroup; }
            set { m_SOPGroup = value; }
		}
	}

	public class CreateSOPGroupDataParameters
	{
		private SOPGroup m_SOPGroup;
		object[] m_Parameters;

        public CreateSOPGroupDataParameters(SOPGroup SOPGroup)
		{
            this.m_SOPGroup = SOPGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.SOPGroup.DistrictId;
            parameters[1] = this.SOPGroup.GroupName;          

            Parameters = parameters;
		}

        public SOPGroup SOPGroup
		{
            get { return m_SOPGroup; }
            set { m_SOPGroup = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
