using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteKitchenPlan : DataAccessBase
    {
        private KitchenPlan m_KitchenPlan;

        public DeleteKitchenPlan()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenPlan.ToString();
        }

        public void Delete()
        {
            //DeleteKitchenPlanDataParameters DeleteParameters = new DeleteKitchenPlanDataParameters(this.m_KitchenPlan);
            object[] parameters = new object[1];
            parameters[0] = this.KitchenPlan.KitchenPlanId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public KitchenPlan KitchenPlan
        {
            get { return m_KitchenPlan; }
            set { m_KitchenPlan = value; }
        }
    }

    public class DeleteKitchenPlanDataParameters
    {
        private KitchenPlan m_KitchenPlan;
        object[] m_Parameters;

        public DeleteKitchenPlanDataParameters(KitchenPlan KitchenPlan)
        {
            this.m_KitchenPlan = KitchenPlan;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.KitchenPlan.KitchenPlanId;

            Parameters = parameters;
        }

        public KitchenPlan KitchenPlan
        {
            get { return m_KitchenPlan; }
            set { m_KitchenPlan = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
