using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Insert
{
   public class CreateKitchenSOPGroup : DataAccessBase
    {
        private KitchenSOPGroup m_KitchenSOPGroup;

		public CreateKitchenSOPGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenSOPGroup.ToString();
		}

		public void Insert()
		{

            CreateKitchenSOPGroupDataParameters createParameters = new CreateKitchenSOPGroupDataParameters(this.m_KitchenSOPGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public KitchenSOPGroup KitchenSOPGroup
		{
            get { return m_KitchenSOPGroup; }
            set { m_KitchenSOPGroup = value; }
		}
	}

	public class CreateKitchenSOPGroupDataParameters
	{
		private KitchenSOPGroup m_KitchenSOPGroup;
		object[] m_Parameters;

        public CreateKitchenSOPGroupDataParameters(KitchenSOPGroup KitchenSOPGroup)
		{
            this.m_KitchenSOPGroup = KitchenSOPGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.KitchenSOPGroup.SOPGroupId;
            parameters[1] = this.KitchenSOPGroup.KitchenId;          

            Parameters = parameters;
		}

        public KitchenSOPGroup KitchenSOPGroup
		{
            get { return m_KitchenSOPGroup; }
            set { m_KitchenSOPGroup = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
    
}
