using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 02/26/2008

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetInventoryItemsByKitchenId : IBusinessLogic
	{
		
        private DataSet m_DataSet;

        public ProcessGetInventoryItemsByKitchenId()
		{
		}

		public void Invoke()
		{
           
		}

        public void Invoke(int nKitchenId)
        {
            GetInventoryItemsByKitchenId inventory = new GetInventoryItemsByKitchenId();
            this.ResultSet = inventory.Get(nKitchenId);
        }
                

		public DataSet ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetInventoryItemsDataSet(int nKitchenId)
        {
            this.Invoke(nKitchenId);
            return this.ResultSet;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetHaccpInventory(int nKitchenId)
        {
            GetInventoryItemsByKitchenId inventory = new GetInventoryItemsByKitchenId();
            this.ResultSet = inventory.GetHaccpInventory(nKitchenId);
            return this.ResultSet;
        }      
               
	}
}