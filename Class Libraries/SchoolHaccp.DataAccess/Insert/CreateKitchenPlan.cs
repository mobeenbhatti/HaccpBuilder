using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
  public  class CreateKitchenPlan : DataAccessBase
    {
        private KitchenPlan m_Plan;

        public CreateKitchenPlan()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenPlan.ToString();
        }

        public void Insert()
        {

            CreatePlanDataParameters createParameters = new CreatePlanDataParameters(this.m_Plan);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }


        public KitchenPlan Plan
        {
            get { return m_Plan; }
            set { m_Plan = value; }
        }
    }

    public class CreatePlanDataParameters
    {
        private KitchenPlan m_Plan;
        object[] m_Parameters;

        public CreatePlanDataParameters(KitchenPlan Plan)
        {
            this.m_Plan = Plan;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[8];
            parameters[0] = this.Plan.KitchenId;
            parameters[1] = this.Plan.KitchenPlanCategoryId;
            parameters[2] = this.Plan.PlanText;
            parameters[3] = this.Plan.PlanTitle;
            parameters[4] = this.Plan.Additional;
            parameters[5] = this.Plan.Custom;
            parameters[6] = this.Plan.KitchenPlanId;
            parameters[7] = this.Plan.Active;

          
            Parameters = parameters;
           
        }

        public KitchenPlan Plan
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
