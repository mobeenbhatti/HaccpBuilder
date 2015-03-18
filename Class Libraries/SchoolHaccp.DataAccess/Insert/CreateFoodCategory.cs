using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateFoodCategory : DataAccessBase
    {
        private FoodCategories m_FoodCategory;
        private FoodCategoryAction m_CorrectiveAction;

        public CreateFoodCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertFoodCategoryByGroupId.ToString();
        }

        public void Insert()
        {

            CreateFoodCategoryDataParameters createParameters = new CreateFoodCategoryDataParameters(this.m_FoodCategory);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }

        public void InsertCriticalLimits()
        {
            object[] parameters = new object[13];
            parameters[0] = this.FoodCategory.FoodCategoryId;           
            parameters[1] = this.FoodCategory.SCLTempHigh;
            parameters[2] = this.FoodCategory.SCLTempLow;
            parameters[3] = this.FoodCategory.CCLTempHigh;
            parameters[4] = this.FoodCategory.CCLTempLow;
            parameters[5] = this.FoodCategory.QCLTempHigh;
            parameters[6] = this.FoodCategory.QCLTempLow;
            parameters[7] = this.FoodCategory.SCLTime1;
            parameters[8] = this.FoodCategory.SCLTime2;
            parameters[9] = this.FoodCategory.CCLTime1;
            parameters[10] = this.FoodCategory.CCLTime2;
            parameters[11] = this.FoodCategory.QCLTime1;
            parameters[12] = this.FoodCategory.QCLTime2;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_InsertFoodCategoryCriticalLimits", parameters);
        }
        public void InsertCorrectiveAction()
        {
            object[] parameters = new object[4];
            parameters[0] = this.CorrectiveAction.FoodCategoryId;
            parameters[1] = this.CorrectiveAction.Name;          
            parameters[2] = this.CorrectiveAction.Status;
            parameters[3] = this.CorrectiveAction.IsInclude;
            DataServices dataServices = new DataServices();
            dataServices.ExecuteNonQuery("uspAdm_InsertFoodCategoryCorrectiveAction", parameters);
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

    public class CreateFoodCategoryDataParameters
    {
        private FoodCategories m_FoodCategory;
        object[] m_Parameters;

        public CreateFoodCategoryDataParameters(FoodCategories FoodCategory)
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
            parameters[7] = this.FoodCategory.FoodCategoryGroupId;
            parameters[8] = this.FoodCategory.Additional;
            parameters[9] = this.FoodCategory.Active;
            parameters[10] = this.FoodCategory.Custom;
            parameters[11] = this.FoodCategory.CCPLimit;
            parameters[12] = this.FoodCategory.CorrectiveAction;
            parameters[13] = this.FoodCategory.SortOrder;
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
