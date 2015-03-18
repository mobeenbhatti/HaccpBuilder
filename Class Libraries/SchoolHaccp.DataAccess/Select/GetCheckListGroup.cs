using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetCheckListGroup : DataAccessBase
    {
        public GetCheckListGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCheckListGroup.ToString();
		}

		public DataSet Get(int nDistrictId)
		{
            GetCheckListGroupDataParameters getParameters = new GetCheckListGroupDataParameters(nDistrictId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteDataSet(getParameters.Parameters);
		}
        public DataSet GetCheckListGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetCheckListGroupByName", parameters);
        }
        public DataSet GetChecklistGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetChecklistGroupById", parameters);
        }
	}

	public class GetCheckListGroupDataParameters
	{
		object[] m_Parameters;

		public GetCheckListGroupDataParameters(int nDistrictId)
		{
            Build(nDistrictId);
		}

		private void Build(int nDistrictId)
		{
			object[] parameters = new object[1];
			parameters[0] = nDistrictId;			
			Parameters = parameters;
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
