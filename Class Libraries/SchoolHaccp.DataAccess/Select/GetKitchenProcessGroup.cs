using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenProcessGroup : DataAccessBase
    {
        public GetKitchenProcessGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenProcessGroup.ToString();
        }

        public IDataReader Get(int nKitchenId)
        {
            GetKitchenProcessGroupDataParameters getParameters = new GetKitchenProcessGroupDataParameters(nKitchenId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteReader(getParameters.Parameters);
        }
    }

    public class GetKitchenProcessGroupDataParameters
    {
        object[] m_Parameters;

        public GetKitchenProcessGroupDataParameters(int nKitchenId)
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
