using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenCCPGroup : DataAccessBase
    {
        public GetKitchenCCPGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenCCPGroup.ToString();
        }

        public IDataReader Get(int nKitchenId)
        {
            GetKitchenCCPGroupDataParameters getParameters = new GetKitchenCCPGroupDataParameters(nKitchenId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteReader(getParameters.Parameters);
        }
    }

    public class GetKitchenCCPGroupDataParameters
    {
        object[] m_Parameters;

        public GetKitchenCCPGroupDataParameters(int nKitchenId)
        {
            Build(nKitchenId);
        }

        private void Build(int nKitchenId)
        {
            object[] parameters = new object[1];
            parameters[0] = nKitchenId;
            Parameters = parameters;
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
