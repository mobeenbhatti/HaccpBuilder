using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
   public class CreateKitchenPlanCategory : DataAccessBase
    {
 private KitchenPlanCategory m_Plan;

        public CreateKitchenPlanCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenPlanCategory.ToString();
        }

        public void Insert()
        {

            CreatePlanCategoryDataParameters createParameters = new CreatePlanCategoryDataParameters(this.m_Plan);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }

        public void CreateKitchenPlanCategoryCustom(int KitchenId, int KitchenPlanCategoryId, string Title )
        {
            object[] parameters = new object[3];
            parameters[0] = KitchenPlanCategoryId;
            parameters[1] = KitchenId;
            parameters[2] = Title;
            DataServices dataServices = new DataServices("uspAdm_InsertKitchenPlanCategoryCustom");
            object returnValue = dataServices.ExecuteScalar(parameters); 
            

        }


        public KitchenPlanCategory Plan
        {
            get { return m_Plan; }
            set { m_Plan = value; }
        }
    }

    public class CreatePlanCategoryDataParameters
    {
        private KitchenPlanCategory m_Plan;
        object[] m_Parameters;

        public CreatePlanCategoryDataParameters(KitchenPlanCategory Plan)
        {
            this.m_Plan = Plan;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[5];
            parameters[0] = this.Plan.KitchenId;
            parameters[1] = this.Plan.Category;
            parameters[2] = this.Plan.Additional;
            parameters[3] = this.Plan.Custom;
            parameters[4] = this.Plan.KitchenPlanCategoryId;
            
    
            
            Parameters = parameters;
           
        }

        public KitchenPlanCategory Plan
        {
            get { return m_Plan; }
            set { m_Plan = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
