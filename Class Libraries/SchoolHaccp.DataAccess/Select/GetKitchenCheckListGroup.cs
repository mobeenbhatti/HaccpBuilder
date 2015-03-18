using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenCheckListGroup : DataAccessBase
    {
        public GetKitchenCheckListGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenCheckListGroup.ToString();
		}

        public IDataReader Get(int nKitchenId)
		{
            GetKitchenCheckListGroupDataParameters getParameters = new GetKitchenCheckListGroupDataParameters(nKitchenId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetKitchenCheckListGroupDataParameters
	{
		object[] m_Parameters;

        public GetKitchenCheckListGroupDataParameters(int nKitchenId)
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
