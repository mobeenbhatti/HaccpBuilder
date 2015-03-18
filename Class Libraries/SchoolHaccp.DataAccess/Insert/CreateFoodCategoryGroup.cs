using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateFoodCategoryGroup : DataAccessBase
    {
        private FoodCategoryGroup m_FoodCategoryGroup;

        public CreateFoodCategoryGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertFoodCategoryGroup.ToString();
        }

        public void Insert()
        {

            CreateFoodCategoryGroupDataParameters createParameters = new CreateFoodCategoryGroupDataParameters(this.m_FoodCategoryGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public FoodCategoryGroup FoodCategoryGroup
        {
            get { return m_FoodCategoryGroup; }
            set { m_FoodCategoryGroup = value; }
        }
    }

    public class CreateFoodCategoryGroupDataParameters
    {
        private FoodCategoryGroup m_FoodCategoryGroup;
        object[] m_Parameters;

        public CreateFoodCategoryGroupDataParameters(FoodCategoryGroup FoodCategoryGroup)
        {
            this.m_FoodCategoryGroup = FoodCategoryGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.FoodCategoryGroup.DistrictId;
            parameters[1] = this.FoodCategoryGroup.GroupName;

            Parameters = parameters;
        }

        public FoodCategoryGroup FoodCategoryGroup
        {
            get { return m_FoodCategoryGroup; }
            set { m_FoodCategoryGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
