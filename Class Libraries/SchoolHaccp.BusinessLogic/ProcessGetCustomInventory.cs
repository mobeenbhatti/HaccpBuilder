using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 02/26/2008

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetCustomInventory : IBusinessLogic
	{
		
        private DataSet m_DataSet;
        private IDataReader m_DataReader;

        public ProcessGetCustomInventory()
		{
		}

		public void Invoke()
		{
            //GetCustomInventory customInventory = new GetCustomInventory();
            //this.ResultReader = customInventory.GetCustomTypes();           
		}

        public void Invoke(int nKitchenId)
        {
            GetCustomInventory customInventory = new GetCustomInventory();
            this.ResultSet = customInventory.Get(nKitchenId);
        }
                

		public DataSet ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}

        public IDataReader ResultReader
        {
            get { return m_DataReader; }
            set { m_DataReader = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCustomInventoryDataSet(int nKitchenId)
        {
            this.Invoke(nKitchenId);
            return this.ResultSet;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCustomTypes(int nKitchenId)
        {
            GetCustomInventory customInventory = new GetCustomInventory();
            return customInventory.GetCustomTypes(nKitchenId);
        }   
               
	}
}