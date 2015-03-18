using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteKitchenFoodCategoryGroup : DataAccessBase
    {
        private KitchenFoodCategoryGroup m_KitchenFoodCategoryGroup;

        public DeleteKitchenFoodCategoryGroup()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteKitchenFoodCategoryGroup.ToString();
        }

        public void Delete()
        {

            DeleteKitchenFoodCategoryGroupDataParameters DeleteParameters = new DeleteKitchenFoodCategoryGroupDataParameters(this.m_KitchenFoodCategoryGroup);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(DeleteParameters.Parameters);

        }

        public KitchenFoodCategoryGroup KitchenFoodCategoryGroup
        {
            get { return m_KitchenFoodCategoryGroup; }
            set { m_KitchenFoodCategoryGroup = value; }
        }
    }

    public class DeleteKitchenFoodCategoryGroupDataParameters
    {
        private KitchenFoodCategoryGroup m_KitchenFoodCategoryGroup;
        object[] m_Parameters;

        public DeleteKitchenFoodCategoryGroupDataParameters(KitchenFoodCategoryGroup KitchenFoodCategoryGroup)
        {
            this.m_KitchenFoodCategoryGroup = KitchenFoodCategoryGroup;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.KitchenFoodCategoryGroup.KitchenId;

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
