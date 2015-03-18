using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Insert
{
   public class CreateKitchenCheckListGroup : DataAccessBase
    {
        private KitchenCheckListGroup m_KitchenCheckListGroup;

		public CreateKitchenCheckListGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenCheckListGroup.ToString();
		}

		public void Insert()
		{

            CreateKitchenCheckListGroupDataParameters createParameters = new CreateKitchenCheckListGroupDataParameters(this.m_KitchenCheckListGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public KitchenCheckListGroup KitchenCheckListGroup
		{
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
		}
	}

	public class CreateKitchenCheckListGroupDataParameters
	{
		private KitchenCheckListGroup m_KitchenCheckListGroup;
		object[] m_Parameters;

        public CreateKitchenCheckListGroupDataParameters(KitchenCheckListGroup KitchenCheckListGroup)
		{
            this.m_KitchenCheckListGroup = KitchenCheckListGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.KitchenCheckListGroup.CheckListGroupId;
            parameters[1] = this.KitchenCheckListGroup.KitchenId;          

            Parameters = parameters;
		}

        public KitchenCheckListGroup KitchenCheckListGroup
		{
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
    
}
