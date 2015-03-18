using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteFoodCategory : DataAccessBase
    {
        private FoodCategories m_FoodCategory;

        public DeleteFoodCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteFoodCategoryByChildId.ToString();
        }

        public void Delete()
        {

            //DeleteFoodCategoryDataParameters DeleteParameters = new DeleteFoodCategoryDataParameters(this.m_FoodCategory);

            object[] parameters = new object[1];
            parameters[0] = this.FoodCategory.FoodCategoryId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public FoodCategories FoodCategory
        {
            get { return m_FoodCategory; }
            set { m_FoodCategory = value; }
        }
    }

    public class DeleteFoodCategoryDataParameters
    {
        private FoodCategories m_FoodCategory;
        object[] m_Parameters;

        public DeleteFoodCategoryDataParameters(FoodCategories FoodCategory)
        {
            this.m_FoodCategory = FoodCategory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.FoodCategory.FoodCategoryId;

            Parameters = parameters;
        }

        public FoodCategories FoodCategory
        {
            get { return m_FoodCategory; }
            set { m_FoodCategory = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
