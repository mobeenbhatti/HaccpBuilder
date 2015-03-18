using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetKitchenPlanCategory : DataAccessBase
    {
        private KitchenPlanCategory m_Plan;

        public SetKitchenPlanCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenPlanCategory.ToString();
        }

        public void Update()
        {
            SetPlanCategoryByIdDataParameters setParameters = new SetPlanCategoryByIdDataParameters(this.m_Plan);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public void UpdateByInclude()
        {
        }
        public void UpdateByStatus()
        {
        }

        public KitchenPlanCategory Plan
        {
            get { return m_Plan; }
            set { m_Plan = value; }
        }
    }

	public class SetPlanCategoryByIdDataParameters
	{
		private KitchenPlanCategory  m_Plan ;
		object[] m_Parameters;

        public SetPlanCategoryByIdDataParameters(KitchenPlanCategory Plan)
		{
			this.m_Plan  = Plan ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[6];
            parameters[0] = this.m_Plan.KitchenPlanCategoryId;
            parameters[1] = this.m_Plan.KitchenId;
            parameters[2] = this.m_Plan.Category;
            parameters[3] = this.m_Plan.Active;
            parameters[4] = this.m_Plan.Additional;
            parameters[5] = this.m_Plan.Custom;
           
       
           // parameters[0] = this.m_Plan.KitchenId;
           // if(this.m_Plan.KitchenPlanCategoryId == 1)
           // {
           //     parameters[1] = this.m_Plan.SanitizationPlan;
           // }
           //if(this.m_Plan.KitchenPlanCategoryId == 2)
           // {
           //    parameters[1] = this.m_Plan.PestControlPlan;
           // }
           // if(this.m_Plan.KitchenPlanCategoryId == 3)
           // {
           //     parameters[1] = this.m_Plan.EquipmentMaintanencePlan;
           // }            
           // parameters[2] = this.m_Plan.KitchenPlanCategoryId;
            
           
            Parameters = parameters;
   
		}

		public KitchenPlanCategory  Plan 
		{
			get { return m_Plan ; }
			set { m_Plan  = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
