using System;
using System.Data;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetCCPGroup : DataAccessBase
    {
        public GetCCPGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCCPGroup.ToString();
        }

        public DataSet Get(int nDistrictId)
        {
            GetCCPGroupDataParameters getParameters = new GetCCPGroupDataParameters(nDistrictId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteDataSet(getParameters.Parameters);
        }
        public DataSet GetCCPGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetCCPGroupByName", parameters);
        }
        public DataSet GetCCPGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetCCPGroupById", parameters);
        }
    }

    public class GetCCPGroupDataParameters
    {
        object[] m_Parameters;

        public GetCCPGroupDataParameters(int nDistrictId)
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
