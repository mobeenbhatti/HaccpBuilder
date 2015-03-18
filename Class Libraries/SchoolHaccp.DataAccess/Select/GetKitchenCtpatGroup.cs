using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenCtpatGroup : DataAccessBase
    {
        public GetKitchenCtpatGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenCtpatGroup.ToString();
        }

        public IDataReader Get(int nKitchenId)
        {
            GetKitchenCtpatGroupDataParameters getParameters = new GetKitchenCtpatGroupDataParameters(nKitchenId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteReader(getParameters.Parameters);
        }
    }

    public class GetKitchenCtpatGroupDataParameters
    {
        object[] m_Parameters;

        public GetKitchenCtpatGroupDataParameters(int nKitchenId)
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
