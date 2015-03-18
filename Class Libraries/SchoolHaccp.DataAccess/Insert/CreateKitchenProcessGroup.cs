using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateKitchenProcessGroup : DataAccessBase
    {
        private KitchenProcessGroup m_KitchenProcessGroup;

        public CreateKitchenProcessGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenProcessGroup.ToString();
        }

        public void Insert()
        {

            CreateKitchenProcessGroupDataParameters createParameters = new CreateKitchenProcessGroupDataParameters(this.m_KitchenProcessGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public KitchenProcessGroup KitchenProcessGroup
        {
            get { return m_KitchenProcessGroup; }
            set { m_KitchenProcessGroup = value; }
        }
    }

    public class CreateKitchenProcessGroupDataParameters
    {
        private KitchenProcessGroup m_KitchenProcessGroup;
        object[] m_Parameters;

        public CreateKitchenProcessGroupDataParameters(KitchenProcessGroup KitchenProcessGroup)
        {
            this.m_KitchenProcessGroup = KitchenProcessGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.KitchenProcessGroup.ProcessGroupId;
            parameters[1] = this.KitchenProcessGroup.KitchenId;

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
