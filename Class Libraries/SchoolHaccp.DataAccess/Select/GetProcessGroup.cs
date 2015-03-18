using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetProcessGroup : DataAccessBase
    {
        public GetProcessGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetProcessGroup.ToString();
        }

        public DataSet Get(int nDistrictId)
        {
            GetProcessGroupDataParameters getParameters = new GetProcessGroupDataParameters(nDistrictId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteDataSet(getParameters.Parameters);
        }
        public DataSet GetProcessGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetProcessGroupByName", parameters);
        }
        public DataSet GetProcessGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetValidationGroupById", parameters);
        }
    }

    public class GetProcessGroupDataParameters
    {
        object[] m_Parameters;

        public GetProcessGroupDataParameters(int nDistrictId)
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
