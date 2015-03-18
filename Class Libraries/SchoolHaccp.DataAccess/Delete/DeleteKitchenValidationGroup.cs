using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteKitchenValidationGroup : DataAccessBase
    {
        private KitchenValidationGroup m_KitchenValidationGroup;

		public DeleteKitchenValidationGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenValidationGroup.ToString();
		}

		public void Delete()
		{

            DeleteKitchenValidationGroupDataParameters DeleteParameters = new DeleteKitchenValidationGroupDataParameters(this.m_KitchenValidationGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters); 
           
		}

        public KitchenValidationGroup KitchenValidationGroup
		{
            get { return m_KitchenValidationGroup; }
            set { m_KitchenValidationGroup = value; }
		}
	}

	public class DeleteKitchenValidationGroupDataParameters
	{
		private KitchenValidationGroup m_KitchenValidationGroup;
		object[] m_Parameters;

        public DeleteKitchenValidationGroupDataParameters(KitchenValidationGroup KitchenValidationGroup)
		{
            this.m_KitchenValidationGroup = KitchenValidationGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];            
            parameters[0] = this.KitchenValidationGroup.KitchenId;          

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
