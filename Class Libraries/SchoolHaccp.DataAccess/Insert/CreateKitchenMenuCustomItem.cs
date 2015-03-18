using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateKitchenMenuCustomItem : DataAccessBase
	{
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

		public CreateKitchenMenuCustomItem()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenMenuCustomItem.ToString();
		}

		public void Insert()
		{
            int KitchenMenuCustomItemId = 0;
            CreateKitchenMenuCustomItemDataParameters createParameters = new CreateKitchenMenuCustomItemDataParameters(this.m_KitchenMenuCustomItem);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {

            object[] parameters = new object[10];
            parameters[0] = this.m_KitchenMenuCustomItem.RecipeNumber;
            parameters[1] = this.m_KitchenMenuCustomItem.Name;
            parameters[2] = this.m_KitchenMenuCustomItem.FoodGroupId;
            parameters[3] = this.m_KitchenMenuCustomItem.PreparationTypeId;
            parameters[4] = this.m_KitchenMenuCustomItem.ProcessId;
            parameters[5] = this.m_KitchenMenuCustomItem.Ready;
            parameters[6] = this.m_KitchenMenuCustomItem.Instructions;
            parameters[7] = this.m_KitchenMenuCustomItem.Selected;
            parameters[8] = this.m_KitchenMenuCustomItem.KitchenId;
            parameters[9] = this.m_KitchenMenuCustomItem.KitchenMenuCustomId;
            DataServices dataServices = new DataServices("uspAdm_InsertKitchenMenuCustomItemPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }


        public KitchenMenuCustomItem KitchenMenuCustomItem
		{
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
		}
	}

	public class CreateKitchenMenuCustomItemDataParameters
	{
		private KitchenMenuCustomItem m_KitchenMenuCustomItem;
		object[] m_Parameters;

        public CreateKitchenMenuCustomItemDataParameters(KitchenMenuCustomItem KitchenMenuCustomItem)
		{
            this.m_KitchenMenuCustomItem = KitchenMenuCustomItem;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[9];
            parameters[0] = this.m_KitchenMenuCustomItem.RecipeNumber;
            parameters[1] = this.m_KitchenMenuCustomItem.Name;
            parameters[2] = this.m_KitchenMenuCustomItem.FoodGroupId;
            parameters[3] = this.m_KitchenMenuCustomItem.PreparationTypeId;
            parameters[4] = this.m_KitchenMenuCustomItem.ProcessId;
            parameters[5] = this.m_KitchenMenuCustomItem.Ready;
            parameters[6] = this.m_KitchenMenuCustomItem.Instructions;
            parameters[7] = this.m_KitchenMenuCustomItem.Selected;
            parameters[8] = this.m_KitchenMenuCustomItem.KitchenId;

            Parameters = parameters;
		}

        public KitchenMenuCustomItem KitchenMenuCustomItem
		{
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
