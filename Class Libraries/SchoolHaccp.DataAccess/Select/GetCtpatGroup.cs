using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetCtpatGroup : DataAccessBase
    {
        public GetCtpatGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetCtpatGroup.ToString();
        }

        public DataSet Get(int nDistrictId)
        {
            GetCtpatGroupDataParameters getParameters = new GetCtpatGroupDataParameters(nDistrictId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteDataSet(getParameters.Parameters);
        }
        public DataSet GetCtpatGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetCtpatGroupByName", parameters);
        }
        public DataSet GetCtpatGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetValidationGroupById", parameters);
        }
    }

    public class GetCtpatGroupDataParameters
    {
        object[] m_Parameters;

        public GetCtpatGroupDataParameters(int nDistrictId)
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
