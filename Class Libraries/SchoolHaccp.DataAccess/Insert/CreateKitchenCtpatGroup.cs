using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateKitchenCtpatGroup : DataAccessBase
    {
        private KitchenCtpatGroup m_KitchenCtpatGroup;

        public CreateKitchenCtpatGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenCtpatGroup.ToString();
        }

        public void Insert()
        {

            CreateKitchenCtpatGroupDataParameters createParameters = new CreateKitchenCtpatGroupDataParameters(this.m_KitchenCtpatGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public KitchenCtpatGroup KitchenCtpatGroup
        {
            get { return m_KitchenCtpatGroup; }
            set { m_KitchenCtpatGroup = value; }
        }
    }

    public class CreateKitchenCtpatGroupDataParameters
    {
        private KitchenCtpatGroup m_KitchenCtpatGroup;
        object[] m_Parameters;

        public CreateKitchenCtpatGroupDataParameters(KitchenCtpatGroup KitchenCtpatGroup)
        {
            this.m_KitchenCtpatGroup = KitchenCtpatGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.KitchenCtpatGroup.CtpatGroupId;
            parameters[1] = this.KitchenCtpatGroup.KitchenId;

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
