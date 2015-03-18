using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
	public class CreateKitchenInventoryCustom : DataAccessBase
	{
        private KitchenInventoryCustom m_KitchenInventoryCustom;

		public CreateKitchenInventoryCustom()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertKitchenInventoryCustom.ToString();
		}

		public void Insert()
		{
            int kitchenInventoryCustomId = 0;
            CreateKitchenInventoryCustomDataParameters createParameters = new CreateKitchenInventoryCustomDataParameters(this.m_KitchenInventoryCustom);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        //public void Insert(string strMode)
        //{
        //    object[] parameters = new object[3];
        //    parameters[0] = this.m_KitchenInventoryCustom.Name;
        //    parameters[1] = this.m_KitchenInventoryCustom.KitchenInventoryCustomId;            
        //    parameters[2] = this.m_KitchenInventoryCustom.KitchenId;            
        //    DataServices dataServices = new DataServices("uspAdm_InsertCustomInventoryTypePHP");
        //    object returnValue = dataServices.ExecuteScalar(parameters);

        //}
        public void Insert(string strMode)
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_KitchenInventoryCustom.Name;
            parameters[1] = this.m_KitchenInventoryCustom.Quantity;
            parameters[2] = this.m_KitchenInventoryCustom.Selected;
            parameters[3] = this.m_KitchenInventoryCustom.KitchenId;
            parameters[4] = this.m_KitchenInventoryCustom.KitchenInventoryCustomId;
            DataServices dataServices = new DataServices("uspAdm_InsertKitchenInventoryCustomPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public KitchenInventoryCustom KitchenInventoryCustom
		{
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
		}
	}

	public class CreateKitchenInventoryCustomDataParameters
	{
		private KitchenInventoryCustom m_KitchenInventoryCustom;
		object[] m_Parameters;

        public CreateKitchenInventoryCustomDataParameters(KitchenInventoryCustom kitchenInventoryCustom)
		{
            this.m_KitchenInventoryCustom = kitchenInventoryCustom;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[5];
            parameters[0] = this.m_KitchenInventoryCustom.Name;
            parameters[1] = this.m_KitchenInventoryCustom.CustomInventoryDesc;
            parameters[2] = this.m_KitchenInventoryCustom.Quantity;
            parameters[3] = this.m_KitchenInventoryCustom.Selected;
            parameters[4] = this.m_KitchenInventoryCustom.KitchenId;
            //parameters[5] = this.m_KitchenInventoryCustom.CustomInventoryDesc;
            Parameters = parameters;
		}

        public KitchenInventoryCustom KitchenInventoryCustom
		{
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
