using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetContact : IBusinessLogic
	{
		
        private DataSet m_DataSet;
        private IDataReader m_DataReader;

        public ProcessGetContact()
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

        public DataSet GetContactByUser(string strUserName)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactByUser(strUserName);
            return this.ResultSet;
        }
        public DataSet GetContactByUser(string strUserName, string strPassword)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactByUser(strUserName,strPassword);
            return this.ResultSet;
        }
        public DataSet GetContactByUserName(string strUserName)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactByUserName(strUserName);
            return this.ResultSet;
        }
        public DataSet GetContactByUserName(string strUserName, int nContactId)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactByUserName(strUserName,nContactId);
            return this.ResultSet;
        }


        public DataSet GetContactByKitchen(int nKitchenId)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactByKitchen(nKitchenId);
            return this.ResultSet;
        }
        public DataSet GetContactsByEmail(string strEmail, int nDistrictId)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactsByEmail(strEmail, nDistrictId);
            return this.ResultSet;
        }
        public DataSet GetContactsByContactId(int  nContactId)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactsByContactId(nContactId);
            return this.ResultSet;
        }
        public DataSet GetContactDetailByContactId(int nContactId)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactDetailByContactId(nContactId);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetContactsByDistrictId(int nDistrictId)
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetContactsByDistrictId(nDistrictId);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet Getroles()
        {
            GetContact contact = new GetContact();
            this.ResultSet = contact.GetRoles();
            return this.ResultSet;
        }
	}
}