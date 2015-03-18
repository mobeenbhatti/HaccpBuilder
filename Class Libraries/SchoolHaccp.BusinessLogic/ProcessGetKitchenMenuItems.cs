using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 03/04/2008

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetKitchenMenuItems : IBusinessLogic
	{
		
        private DataSet m_DataSet;

        public ProcessGetKitchenMenuItems()
		{
		}

		public void Invoke()
		{
           
		}

        public void Invoke(int nKitchenId, int nPageId)
        {
            GetKitchenMenuItems menuItem = new GetKitchenMenuItems();
            this.ResultSet = menuItem.Get(nKitchenId,nPageId);
        }
                

		public DataSet ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMenuItemsDataSet(int nKitchenId, int nPageId)
        {
            this.Invoke(nKitchenId,nPageId);
            return this.ResultSet;
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetHaccpMenuItem(int nKitchenId)
        {
            GetKitchenMenuItems menuItem = new GetKitchenMenuItems();
            this.ResultSet = menuItem.GetHaccpMenuItem(nKitchenId);
            return this.ResultSet;
        }      
               
	}
}