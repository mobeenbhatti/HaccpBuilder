using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteKitchenPlanCategory : DataAccessBase
    {
        private KitchenPlanCategory m_KitchenPlanCategory;

        public DeleteKitchenPlanCategory()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenPlanCategory.ToString();
        }

        public void Delete()
        {

            //DeleteKitchenPlanCategoryDataParameters DeleteParameters = new DeleteKitchenPlanCategoryDataParameters(this.m_KitchenPlanCategory);

            object[] parameters = new object[2];
            parameters[0] = this.KitchenPlanCategory.KitchenPlanCategoryId;
            parameters[1] = this.KitchenPlanCategory.KitchenId;
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public KitchenPlanCategory KitchenPlanCategory
        {
            get { return m_KitchenPlanCategory; }
            set { m_KitchenPlanCategory = value; }
        }
    }

    public class DeleteKitchenPlanCategoryDataParameters
    {
        private KitchenPlanCategory m_KitchenPlanCategory;
        object[] m_Parameters;

        public DeleteKitchenPlanCategoryDataParameters(KitchenPlanCategory KitchenPlanCategory)
        {
            this.m_KitchenPlanCategory = KitchenPlanCategory;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.KitchenPlanCategory.KitchenPlanCategoryId;

            Parameters = parameters;
        }

        public KitchenPlanCategory KitchenPlanCategory
        {
            get { return m_KitchenPlanCategory; }
            set { m_KitchenPlanCategory = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
