using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
   public class DeleteKitchenSOPGroup : DataAccessBase
    {
        private KitchenSOPGroup m_KitchenSOPGroup;

		public DeleteKitchenSOPGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenSOPGroup.ToString();
		}

		public void Delete()
		{

            DeleteKitchenSOPGroupDataParameters DeleteParameters = new DeleteKitchenSOPGroupDataParameters(this.m_KitchenSOPGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters); 
           
		}

        public KitchenSOPGroup KitchenSOPGroup
		{
            get { return m_KitchenSOPGroup; }
            set { m_KitchenSOPGroup = value; }
		}
	}

	public class DeleteKitchenSOPGroupDataParameters
	{
		private KitchenSOPGroup m_KitchenSOPGroup;
		object[] m_Parameters;

        public DeleteKitchenSOPGroupDataParameters(KitchenSOPGroup KitchenSOPGroup)
		{
            this.m_KitchenSOPGroup = KitchenSOPGroup;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[1];            
            parameters[0] = this.KitchenSOPGroup.KitchenId;          

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
