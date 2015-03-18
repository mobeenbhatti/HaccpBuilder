using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Update
{
    public class SetFoodCategory : DataAccessBase
    {
        private FoodCategories m_FoodCategory;
        private FoodCategoryAction m_CorrectiveAction;

        public SetFoodCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateFoodCategory.ToString();
        }

        public void Update()
        {
            SetFoodCategoryByIdDataParameters setParameters = new SetFoodCategoryByIdDataParameters(this.m_FoodCategory);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public void UpdateSelection()
        {
            object[] parameters = new object[2];
            parameters[0] = this.FoodCategory.FoodCategoryId;
            parameters[1] = this.FoodCategory.Active;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateFoodCategorySelection", parameters);
        }

        public void UpdateFoodCategoryCriticalLimits()
        {
            object[] parameters = new object[14];
            parameters[0] = this.FoodCategory.CriticalLimitID;
            parameters[1] = this.FoodCategory.FoodCategoryId;           
            parameters[2] = this.FoodCategory.SCLTempHigh;
            parameters[3] = this.FoodCategory.SCLTempLow;
            parameters[4] = this.FoodCategory.CCLTempHigh;
            parameters[5] = this.FoodCategory.CCLTempLow;
            parameters[6] = this.FoodCategory.QCLTempHigh;
            parameters[7] = this.FoodCategory.QCLTempLow;
            parameters[8] = this.FoodCategory.SCLTime1;
            parameters[9] = this.FoodCategory.SCLTime2;
            parameters[10] = this.FoodCategory.CCLTime1;
            parameters[11] = this.FoodCategory.CCLTime2;
            parameters[12] = this.FoodCategory.QCLTime1;
            parameters[13] = this.FoodCategory.QCLTime2;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateFoodCategoryCriticalLimitsById", parameters);
        }
        public void UpdateFoodCategoryCorrectiveActions()
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_CorrectiveAction.CorrectiveActionID;
            parameters[1] = this.m_CorrectiveAction.FoodCategoryId;
            parameters[2] = this.m_CorrectiveAction.Name;           
            parameters[3] = this.m_CorrectiveAction.Status;
            parameters[4] = this.m_CorrectiveAction.IsInclude;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_UpdateFoodCategoryActionById", parameters);
        }

        public FoodCategories FoodCategory
        {
            get { return m_FoodCategory; }
            set { m_FoodCategory = value; }
        }
        public FoodCategoryAction CorrectiveAction
        {
            get { return m_CorrectiveAction; }
            set { m_CorrectiveAction = value; }
        }
    }

    public class SetFoodCategoryByIdDataParameters
    {
        private FoodCategories m_FoodCategory;
        object[] m_Parameters;

        public SetFoodCategoryByIdDataParameters(FoodCategories FoodCategory)
        {
            this.m_FoodCategory = FoodCategory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[14];
            parameters[0] = this.FoodCategory.FoodCategoryId;
            parameters[1] = this.FoodCategory.FoodCategory;
            parameters[2] = this.FoodCategory.BiologicalHazard;
            parameters[3] = this.FoodCategory.ChemicalHazard;
            parameters[4] = this.FoodCategory.PhysicalHazard;
            parameters[5] = this.FoodCategory.CCP;
            parameters[6] = this.FoodCategory.CP;
            parameters[7] = this.FoodCategory.Active;
            parameters[8] = this.FoodCategory.FoodCategoryGroupId;
            parameters[9] = this.FoodCategory.Additional;
            parameters[10] = this.FoodCategory.Custom;
            parameters[11] = this.FoodCategory.CCPLimit;
            parameters[12] = this.FoodCategory.CorrectiveAction;
            parameters[13] = this.FoodCategory.SortOrder;
            //parameters[7] = this.FoodCategory.ChildFoodCategoryId;
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
