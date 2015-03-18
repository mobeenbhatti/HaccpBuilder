using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteKitchenCheckListAddOnGroup: DataAccessBase
    {
         private KitchenCheckListAddOnGroup m_KitchenCheckListGroup;

		public DeleteKitchenCheckListAddOnGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenCheckListAddOnGroup.ToString();
		}

		public void Delete()
		{

            DeleteKitchenCheckListGroupAddOnParameters DeleteParameters = new DeleteKitchenCheckListGroupAddOnParameters(this.m_KitchenCheckListGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters); 
           
		}

        public KitchenCheckListAddOnGroup KitchenCheckListGroup
		{
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
		}
	}

	public class DeleteKitchenCheckListGroupAddOnParameters
	{
		private KitchenCheckListAddOnGroup m_KitchenCheckListGroup;
		object[] m_Parameters;

        public DeleteKitchenCheckListGroupAddOnParameters(KitchenCheckListAddOnGroup KitchenCheckListGroup)
		{
            this.m_KitchenCheckListGroup = KitchenCheckListGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];            
            parameters[0] = this.KitchenCheckListGroup.KitchenId;          

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
