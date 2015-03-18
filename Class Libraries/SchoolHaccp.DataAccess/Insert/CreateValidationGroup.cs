using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert 
{
  public  class CreateValidationGroup : DataAccessBase
    {
        private ValidationGroup m_ValidationGroup;

		public CreateValidationGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertValidationGroup.ToString();
		}

		public void Insert()
		{

            CreateValidationGroupDataParameters createParameters = new CreateValidationGroupDataParameters(this.m_ValidationGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public ValidationGroup ValidationGroup
		{
            get { return m_ValidationGroup; }
            set { m_ValidationGroup = value; }
		}
	}

	public class CreateValidationGroupDataParameters
	{
		private ValidationGroup m_ValidationGroup;
		object[] m_Parameters;

        public CreateValidationGroupDataParameters(ValidationGroup ValidationGroup)
		{
            this.m_ValidationGroup = ValidationGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.ValidationGroup.DistrictId;
            parameters[1] = this.ValidationGroup.GroupName;          

            Parameters = parameters;
		}

        public ValidationGroup ValidationGroup
		{
            get { return m_ValidationGroup; }
            set { m_ValidationGroup = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
