using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
   public class SetKitchenPlan: DataAccessBase
	{
		private KitchenPlan  m_Plan ;

        public SetKitchenPlan()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenPlan.ToString();
		}

		public void Update()
		{
			SetPlanByIdDataParameters setParameters = new SetPlanByIdDataParameters(this.m_Plan );
			DataServices dataServices = new DataServices(base.StoredProcedureName);
			dataServices.ExecuteNonQuery(setParameters.Parameters);
		}

        public void UpdateByInclude()
        {
        }
        public void UpdateByStatus()
        {
        }

		public KitchenPlan  Plan 
		{
			get { return m_Plan ; }
			set { m_Plan  = value; }
		}
	}

	public class SetPlanByIdDataParameters
	{
		private KitchenPlan  m_Plan ;
		object[] m_Parameters;

		public SetPlanByIdDataParameters(KitchenPlan  Plan )
		{
			this.m_Plan  = Plan ;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[8];
            parameters[0] = this.m_Plan.KitchenPlanId;
            parameters[1] = this.m_Plan.KitchenId;
            parameters[2] = this.m_Plan.KitchenPlanCategoryId;
            parameters[3] = this.m_Plan.PlanText;
            parameters[4] = this.m_Plan.PlanTitle;
            parameters[5] = this.m_Plan.Active;
            parameters[6] = this.Plan.Additional;
            parameters[7] = this.Plan.Custom;
           
           
           
           // parameters[0] = this.m_Plan.KitchenId;
           // if(this.m_Plan.KitchenPlanId == 1)
           // {
           //     parameters[1] = this.m_Plan.SanitizationPlan;
           // }
           //if(this.m_Plan.KitchenPlanId == 2)
           // {
           //    parameters[1] = this.m_Plan.PestControlPlan;
           // }
           // if(this.m_Plan.KitchenPlanId == 3)
           // {
           //     parameters[1] = this.m_Plan.EquipmentMaintanencePlan;
           // }            
           // parameters[2] = this.m_Plan.KitchenPlanId;
            
           
            Parameters = parameters;
   
		}

		public KitchenPlan  Plan 
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

   