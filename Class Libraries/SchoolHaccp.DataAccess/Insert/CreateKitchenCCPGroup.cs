using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateKitchenCCPGroup : DataAccessBase
    {
        private KitchenCCPGroup m_KitchenCCPGroup;

        public CreateKitchenCCPGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenCCPGroup.ToString();
        }

        public void Insert()
        {

            CreateKitchenCCPGroupDataParameters createParameters = new CreateKitchenCCPGroupDataParameters(this.m_KitchenCCPGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public KitchenCCPGroup KitchenCCPGroup
        {
            get { return m_KitchenCCPGroup; }
            set { m_KitchenCCPGroup = value; }
        }
    }

    public class CreateKitchenCCPGroupDataParameters
    {
        private KitchenCCPGroup m_KitchenCCPGroup;
        object[] m_Parameters;

        public CreateKitchenCCPGroupDataParameters(KitchenCCPGroup KitchenCCPGroup)
        {
            this.m_KitchenCCPGroup = KitchenCCPGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.KitchenCCPGroup.CCPGroupId;
            parameters[1] = this.KitchenCCPGroup.KitchenId;

            Parameters = parameters;
        }

        public KitchenCCPGroup KitchenCCPGroup
        {
            get { return m_KitchenCCPGroup; }
            set { m_KitchenCCPGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
