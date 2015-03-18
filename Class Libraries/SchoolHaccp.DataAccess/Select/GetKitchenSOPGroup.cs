using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenSOPGroup : DataAccessBase
    {
        public GetKitchenSOPGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenSOPGroup.ToString();
		}

        public IDataReader Get(int nKitchenId)
		{
            GetKitchenSOPGroupDataParameters getParameters = new GetKitchenSOPGroupDataParameters(nKitchenId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetKitchenSOPGroupDataParameters
	{
		object[] m_Parameters;

        public GetKitchenSOPGroupDataParameters(int nKitchenId)
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
