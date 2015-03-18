using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteKitchenProcessGroup : DataAccessBase
    {
        private KitchenProcessGroup m_KitchenProcessGroup;

        public DeleteKitchenProcessGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenProcessGroup.ToString();
        }

        public void Delete()
        {

            DeleteKitchenProcessGroupDataParameters DeleteParameters = new DeleteKitchenProcessGroupDataParameters(this.m_KitchenProcessGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters);

        }

        public KitchenProcessGroup KitchenProcessGroup
        {
            get { return m_KitchenProcessGroup; }
            set { m_KitchenProcessGroup = value; }
        }
    }

    public class DeleteKitchenProcessGroupDataParameters
    {
        private KitchenProcessGroup m_KitchenProcessGroup;
        object[] m_Parameters;

        public DeleteKitchenProcessGroupDataParameters(KitchenProcessGroup KitchenProcessGroup)
        {
            this.m_KitchenProcessGroup = KitchenProcessGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.KitchenProcessGroup.KitchenId;

            Parameters = parameters;
        }

        public KitchenProcessGroup KitchenProcessGroup
        {
            get { return m_KitchenProcessGroup; }
            set { m_KitchenProcessGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }

}
