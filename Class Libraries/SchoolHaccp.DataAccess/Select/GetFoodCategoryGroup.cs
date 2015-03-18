using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetFoodCategoryGroup : DataAccessBase
    {
        public GetFoodCategoryGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetFoodCategoryGroup.ToString();
        }

        public DataSet Get(int nDistrictId)
        {
            GetFoodCategoryGroupDataParameters getParameters = new GetFoodCategoryGroupDataParameters(nDistrictId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteDataSet(getParameters.Parameters);
        }
        public DataSet GetFoodCategoryGroupByName(int nDistrictId, string strGroupName)
        {
            Object[] parameters = new object[2];
            parameters[0] = nDistrictId;
            parameters[1] = strGroupName;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetFoodCategoryGroupByName", parameters);
        }
        public DataSet GetFoodCategoryGroupById(int nGroupId)
        {
            Object[] parameters = new object[1];
            parameters[0] = nGroupId;
            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetFoodCategoryGroupById", parameters);
        }
    }

    public class GetFoodCategoryGroupDataParameters
    {
        object[] m_Parameters;

        public GetFoodCategoryGroupDataParameters(int nDistrictId)
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
