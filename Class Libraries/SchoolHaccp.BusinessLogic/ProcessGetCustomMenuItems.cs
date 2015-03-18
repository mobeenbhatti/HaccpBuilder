using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 02/26/2008

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetCustomMenuItems : IBusinessLogic
	{
		
        private DataSet m_DataSet;
        private IDataReader m_DataReader;

        public ProcessGetCustomMenuItems()
		{
		}

		public void Invoke(string strRequired)
		{
            if (strRequired == "FoodGroup")
            {
                GetKitchenMenuCustomItem customMenu = new GetKitchenMenuCustomItem();
                this.ResultReader = customMenu.GetFoodGroups();
            }
            else
            {
                GetKitchenMenuCustomItem customMenu = new GetKitchenMenuCustomItem();
                this.ResultReader = customMenu.GetProcesses();
            }
		}
        public void Invoke()
        {
            
        }

        public void Invoke(int nKitchenId)
        {
            GetKitchenMenuCustomItem customInventory = new GetKitchenMenuCustomItem();
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
        public DataSet GetCustomMenuItemsDataSet(int nKitchenId)
        {
            this.Invoke(nKitchenId);
            return this.ResultSet;
        }
       
        public IDataReader GetFoodGroup()
        {
            this.Invoke("FoodGroup");
            return this.ResultReader;
        }
        public IDataReader GetProcesses()
        {
            this.Invoke("Processes");
            return this.ResultReader;
        }   
               
	}
}