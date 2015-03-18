using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 02/28/2008

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetMenuItems : IBusinessLogic
	{
		
        private DataSet m_DataSet;

        public ProcessGetMenuItems()
		{
		}

		public void Invoke()
		{
            GetMenuItems menuItem = new GetMenuItems();
            this.ResultSet = menuItem.GetFoodGroups();
		}

        public void Invoke(int nKitchenId)
        {
            GetMenuItems menuItem = new GetMenuItems();
            this.ResultSet = menuItem.Get(nKitchenId);
        }
                

		public DataSet ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemsDataSet(int nKitchenId)
        {
            this.Invoke(nKitchenId);
            return this.ResultSet;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetfoodGroupsDataSet()
        {
            this.Invoke();
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemsDataSetByProcess(int nKitchenId, int nProcessId)
        {
            GetMenuItems menuItem = new GetMenuItems();
            this.ResultSet = menuItem.GetMenuItemsByProcess(nKitchenId,nProcessId);
            return this.ResultSet;
        }
        public DataSet GetMealServingMenuItems(DateTime dtSelectedDate,int nKitchenId)
        {
            GetMenuItems menuItem = new GetMenuItems();
            this.ResultSet = menuItem.GetMealServingMenuItems(dtSelectedDate,nKitchenId);
            return this.ResultSet;
        }
        public DataSet GetMealServingDates(int nKitchenId)
        {
            GetMenuItems menuItem = new GetMenuItems();
            this.ResultSet = menuItem.GetMealServingDates(nKitchenId);
            return this.ResultSet;
        }
               
	}
}