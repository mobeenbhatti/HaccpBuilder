using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteKitchenCtpatGroup : DataAccessBase
    {
        private KitchenCtpatGroup m_KitchenCtpatGroup;

        public DeleteKitchenCtpatGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenCtpatGroup.ToString();
        }

        public void Delete()
        {

            DeleteKitchenCtpatGroupDataParameters DeleteParameters = new DeleteKitchenCtpatGroupDataParameters(this.m_KitchenCtpatGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters);

        }

        public KitchenCtpatGroup KitchenCtpatGroup
        {
            get { return m_KitchenCtpatGroup; }
            set { m_KitchenCtpatGroup = value; }
        }
    }

    public class DeleteKitchenCtpatGroupDataParameters
    {
        private KitchenCtpatGroup m_KitchenCtpatGroup;
        object[] m_Parameters;

        public DeleteKitchenCtpatGroupDataParameters(KitchenCtpatGroup KitchenCtpatGroup)
        {
            this.m_KitchenCtpatGroup = KitchenCtpatGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.KitchenCtpatGroup.KitchenId;

            Parameters = parameters;
        }

        public KitchenCtpatGroup KitchenCtpatGroup
        {
            get { return m_KitchenCtpatGroup; }
            set { m_KitchenCtpatGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
