using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateKitchenCheckListAddonGroup : DataAccessBase
    {
        private KitchenCheckListAddOnGroup m_KitchenCheckListGroup;

        public CreateKitchenCheckListAddonGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenCheckListAddOnGroup.ToString();
		}

		public void Insert()
		{

            CreateKitchenCheckListGroupAddOnParameters createParameters = new CreateKitchenCheckListGroupAddOnParameters(this.m_KitchenCheckListGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}

        public KitchenCheckListAddOnGroup KitchenCheckListGroup
		{
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
		}
	}

	public class CreateKitchenCheckListGroupAddOnParameters
	{
        private KitchenCheckListAddOnGroup m_KitchenCheckListGroup;
		object[] m_Parameters;

        public CreateKitchenCheckListGroupAddOnParameters(KitchenCheckListAddOnGroup KitchenCheckListGroup)
		{
            this.m_KitchenCheckListGroup = KitchenCheckListGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[2];
            parameters[0] = this.KitchenCheckListGroup.CheckListAddOnGroupId;
            parameters[1] = this.KitchenCheckListGroup.KitchenId;          

            Parameters = parameters;
		}

        public KitchenCheckListAddOnGroup KitchenCheckListGroup
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
