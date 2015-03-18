using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert 
{
  public  class CreateCheckListGroup : DataAccessBase
    {
        private CheckListGroup m_CheckListGroup;

		public CreateCheckListGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertCheckListGroup.ToString();
		}

		public void Insert()
		{

            CreateCheckListGroupDataParameters createParameters = new CreateCheckListGroupDataParameters(this.m_CheckListGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public CheckListGroup CheckListGroup
		{
            get { return m_CheckListGroup; }
            set { m_CheckListGroup = value; }
		}
	}

	public class CreateCheckListGroupDataParameters
	{
		private CheckListGroup m_CheckListGroup;
		object[] m_Parameters;

        public CreateCheckListGroupDataParameters(CheckListGroup CheckListGroup)
		{
            this.m_CheckListGroup = CheckListGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.CheckListGroup.DistrictId;
            parameters[1] = this.CheckListGroup.GroupName;          

            Parameters = parameters;
		}

        public CheckListGroup CheckListGroup
		{
            get { return m_CheckListGroup; }
            set { m_CheckListGroup = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
