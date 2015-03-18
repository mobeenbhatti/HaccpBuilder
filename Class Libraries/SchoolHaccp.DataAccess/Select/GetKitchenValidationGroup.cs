using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenValidationGroup : DataAccessBase
    {
        public GetKitchenValidationGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenValidationGroup.ToString();
		}

        public IDataReader Get(int nKitchenId)
		{
            GetKitchenValidationGroupDataParameters getParameters = new GetKitchenValidationGroupDataParameters(nKitchenId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetKitchenValidationGroupDataParameters
	{
		object[] m_Parameters;

        public GetKitchenValidationGroupDataParameters(int nKitchenId)
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
