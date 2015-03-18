using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenCheckListAddOnGroup : DataAccessBase
    {
        public GetKitchenCheckListAddOnGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenCheckListAddOnGroup.ToString();
		}

        public IDataReader Get(int nKitchenId)
		{
            GetKitchenCheckListGroupAddOnParameters getParameters = new GetKitchenCheckListGroupAddOnParameters(nKitchenId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteReader(getParameters.Parameters);
		}
	}

	public class GetKitchenCheckListGroupAddOnParameters
	{
		object[] m_Parameters;

        public GetKitchenCheckListGroupAddOnParameters(int nKitchenId)
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
