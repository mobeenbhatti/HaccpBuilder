using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateKitchenFoodCategoryGroup : DataAccessBase
    {
        private KitchenFoodCategoryGroup m_KitchenFoodCategoryGroup;

        public CreateKitchenFoodCategoryGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenFoodCategoryGroup.ToString();
        }

        public void Insert()
        {

            CreateKitchenFoodCategoryGroupDataParameters createParameters = new CreateKitchenFoodCategoryGroupDataParameters(this.m_KitchenFoodCategoryGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public KitchenFoodCategoryGroup KitchenFoodCategoryGroup
        {
            get { return m_KitchenFoodCategoryGroup; }
            set { m_KitchenFoodCategoryGroup = value; }
        }
    }

    public class CreateKitchenFoodCategoryGroupDataParameters
    {
        private KitchenFoodCategoryGroup m_KitchenFoodCategoryGroup;
        object[] m_Parameters;

        public CreateKitchenFoodCategoryGroupDataParameters(KitchenFoodCategoryGroup KitchenFoodCategoryGroup)
        {
            this.m_KitchenFoodCategoryGroup = KitchenFoodCategoryGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[2];
            parameters[0] = this.KitchenFoodCategoryGroup.FoodCategoryGroupId;
            parameters[1] = this.KitchenFoodCategoryGroup.KitchenId;

            Parameters = parameters;
        }

        public KitchenFoodCategoryGroup KitchenFoodCategoryGroup
        {
            get { return m_KitchenFoodCategoryGroup; }
            set { m_KitchenFoodCategoryGroup = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
