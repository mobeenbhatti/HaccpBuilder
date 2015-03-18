using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetSOPGroup : DataAccessBase
    {
        public GetSOPGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetSOPGroup.ToString();
		}

		public DataSet Get(int nDistrictId)
		{
            GetSOPGroupDataParameters getParameters = new GetSOPGroupDataParameters(nDistrictId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteDataSet(getParameters.Parameters);
		}
        public DataSet GetSOPGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetSOPGroupByName", parameters);
        }
        public DataSet GetSOPGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetValidationGroupById", parameters);
        }
	}

	public class GetSOPGroupDataParameters
	{
		object[] m_Parameters;

		public GetSOPGroupDataParameters(int nDistrictId)
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
