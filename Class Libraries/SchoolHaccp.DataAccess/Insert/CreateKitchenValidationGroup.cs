using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Insert
{
   public class CreateKitchenValidationGroup : DataAccessBase
    {
        private KitchenValidationGroup m_KitchenValidationGroup;

		public CreateKitchenValidationGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenValidationGroup.ToString();
		}

		public void Insert()
		{

            CreateKitchenValidationGroupDataParameters createParameters = new CreateKitchenValidationGroupDataParameters(this.m_KitchenValidationGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public KitchenValidationGroup KitchenValidationGroup
		{
            get { return m_KitchenValidationGroup; }
            set { m_KitchenValidationGroup = value; }
		}
	}

	public class CreateKitchenValidationGroupDataParameters
	{
		private KitchenValidationGroup m_KitchenValidationGroup;
		object[] m_Parameters;

        public CreateKitchenValidationGroupDataParameters(KitchenValidationGroup KitchenValidationGroup)
		{
            this.m_KitchenValidationGroup = KitchenValidationGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.KitchenValidationGroup.ValidationGroupId;
            parameters[1] = this.KitchenValidationGroup.KitchenId;          

            Parameters = parameters;
		}

        public KitchenValidationGroup KitchenValidationGroup
		{
            get { return m_KitchenValidationGroup; }
            set { m_KitchenValidationGroup = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
    
}

