using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Select
{
    public class GetValidationGroup : DataAccessBase
    {
        public GetValidationGroup()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetValidationGroup.ToString();
		}

		public DataSet Get(int nDistrictId)
		{
            GetValidationGroupDataParameters getParameters = new GetValidationGroupDataParameters(nDistrictId);
			DataServices ds = new DataServices(base.StoredProcedureName);
			return ds.ExecuteDataSet(getParameters.Parameters);
		}
        public DataSet GetValidationGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetValidationGroupByName", parameters);
        }

        public DataSet GetValidationGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;            
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetValidationGroupById", parameters);
        }
	}

	public class GetValidationGroupDataParameters
	{
		object[] m_Parameters;

		public GetValidationGroupDataParameters(int nDistrictId)
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
