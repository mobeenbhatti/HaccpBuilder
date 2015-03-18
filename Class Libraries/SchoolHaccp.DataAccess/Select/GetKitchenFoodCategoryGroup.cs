using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetKitchenFoodCategoryGroup : DataAccessBase
    {
        public GetKitchenFoodCategoryGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_GetKitchenFoodCategoryGroup.ToString();
        }

        public IDataReader Get(int nKitchenId)
        {
            GetKitchenFoodCategoryGroupDataParameters getParameters = new GetKitchenFoodCategoryGroupDataParameters(nKitchenId);
            DataServices ds = new DataServices(base.StoredProcedureName);
            return ds.ExecuteReader(getParameters.Parameters);
        }
        public IDataReader GetKichenFoodCategoryByName(string sFoodCategoryFoodName, int nKitchenId)
        {
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = sFoodCategoryFoodName;

            DataServices ds = new DataServices("uspAdm_GetKitchenFoodCategoryByName");
            return ds.ExecuteReader(parameters);
        }
    }

    public class GetKitchenFoodCategoryGroupDataParameters
    {
        object[] m_Parameters;

        public GetKitchenFoodCategoryGroupDataParameters(int nKitchenId)
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
