using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteKitchenCheckListGroup : DataAccessBase
    {
        private KitchenCheckListGroup m_KitchenCheckListGroup;

		public DeleteKitchenCheckListGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenCheckListGroup.ToString();
		}

		public void Delete()
		{

            DeleteKitchenCheckListGroupDataParameters DeleteParameters = new DeleteKitchenCheckListGroupDataParameters(this.m_KitchenCheckListGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters); 
           
		}

        public KitchenCheckListGroup KitchenCheckListGroup
		{
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
		}
	}

	public class DeleteKitchenCheckListGroupDataParameters
	{
		private KitchenCheckListGroup m_KitchenCheckListGroup;
		object[] m_Parameters;

        public DeleteKitchenCheckListGroupDataParameters(KitchenCheckListGroup KitchenCheckListGroup)
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
