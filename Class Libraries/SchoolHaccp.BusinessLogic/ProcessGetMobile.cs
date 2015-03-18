
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;


namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetMobile : IBusinessLogic
    {
        private IDataReader m_DataSet;
        private Mobile m_Mobile;
        private Contact m_Contact;
        private Address m_Address;

        public ProcessGetMobile()
        {
            this.Mobile = new Mobile();
            this.Address = new Address();
            this.Contact = new Contact();
        }

        public void Invoke()
        {

        }
        public void Invoke(int nMobileId)
        {
            GetMobileByUserName getMobile = new GetMobileByUserName();
            DataSet dsMobile = getMobile.GetMobileById(nMobileId);
           
            if (dsMobile.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in dsMobile.Tables[0].Rows)
                {
                    this.Mobile.Active = int.Parse(dr["Active"].ToString());
                    this.Mobile.ColdHoldingLog = int.Parse(dr["ColdHoldingLog"].ToString());
                    this.Mobile.ColdHoldingLogAlert = int.Parse(dr["ColdHoldingLogAlert"].ToString());
                    this.Mobile.FoodSafetyCheckList = int.Parse(dr["FoodSafetyCheckList"].ToString());
                    this.Mobile.FoodSafetyCheckListAlert = int.Parse(dr["FoodSafetyCheckListAlert"].ToString());
                    this.Mobile.FreezerLog = int.Parse(dr["FreezerLog"].ToString());
                    this.Mobile.FreezerLogAlert = int.Parse(dr["FreezerLogAlert"].ToString());
                    this.Mobile.FreezerNewLog = int.Parse(dr["FreezerNewLog"].ToString());
                    this.Mobile.FreezerNewLogAlert = int.Parse(dr["FreezerNewLogAlert"].ToString());
                    this.Mobile.HotHoldingLog = int.Parse(dr["HotHoldingLog"].ToString());
                    this.Mobile.HotHoldingLogAlert = int.Parse(dr["HotHoldingLogAlert"].ToString());
                    this.Mobile.KitchenId = int.Parse(dr["KitchenId"].ToString());
                    this.Mobile.MobileId = int.Parse(dr["MobileId"].ToString());
                    this.Mobile.ReceivingLog = int.Parse(dr["ReceivingLog"].ToString());
                    this.Mobile.ReceivingLogAlert = int.Parse(dr["ReceivingLogAlert"].ToString());
                    this.Mobile.RefrigerationLog = int.Parse(dr["RefrigerationLog"].ToString());
                    this.Mobile.RefrigerationLogAlert = int.Parse(dr["RefrigerationLogAlert"].ToString());
                    this.Mobile.ShippingLog = int.Parse(dr["ShippingLog"].ToString());
                    this.Mobile.ShippingLogAlert = int.Parse(dr["ShippingLogAlert"].ToString());
                    this.Mobile.TemperatureLog = int.Parse(dr["TemperatureLog"].ToString());
                    this.Mobile.TemperatureLogAlert = int.Parse(dr["TemperatureLogAlert"].ToString());
                    this.Mobile.Thermometer = int.Parse(dr["Thermometer"].ToString());
                    this.Mobile.ThermometerAlert = int.Parse(dr["ThermometerAlert"].ToString());
                    this.Mobile.Validation = int.Parse(dr["Validation"].ToString());
                    this.Mobile.ValidationAlert = int.Parse(dr["ValidationAlert"].ToString());
                    this.Mobile.PhLog = int.Parse(dr["PhLog"].ToString());
                    this.Mobile.PhLogAlert = int.Parse(dr["PhLogAlert"].ToString());
                    this.Mobile.PestLog = int.Parse(dr["PestLog"].ToString());
                    this.Mobile.PestLogAlert = int.Parse(dr["PestLogAlert"].ToString());
                    this.Mobile.MaintenanceLog = int.Parse(dr["MaintenanceLog"].ToString());
                    this.Mobile.MaintenanceLogAlert = int.Parse(dr["MaintenanceLogAlert"].ToString());
                    this.Mobile.CleaningLog = int.Parse(dr["CleaningLog"].ToString());
                    this.Mobile.CleaningLogAlert = int.Parse(dr["CleaningLogAlert"].ToString());
                    this.Mobile.CheckList = int.Parse(dr["Checklist"].ToString());
                    this.Mobile.CheckListAlert = int.Parse(dr["ChecklistAlert"].ToString());
                    this.Address.AddressId = int.Parse(dr["AddressId"].ToString());
                    this.Address.AddressOne = dr["AddressLine1"].ToString();
                    this.Address.AddressTwo = dr["AddressLine2"].ToString();
                    this.Address.City = dr["City"].ToString();
                    //this.Address.State = dr["State"].ToString();
                    this.Address.ZipCode = dr["PostalCode"].ToString();
                    this.Address.TimeZone = dr["TimeZone"].ToString();


                    this.Contact.ContactId = int.Parse(dr["ContactId"].ToString());
                    this.Contact.AltPhone = dr["SecondaryPhone"].ToString();
                    this.Contact.Fax = dr["Fax"].ToString();
                    this.Contact.Email = dr["EmailAddress"].ToString();
                    this.Contact.Name = dr["Manager"].ToString();
                    this.Contact.Phone = dr["PrimaryPhone"].ToString();
                    this.Contact.EmailAlerts = 0;
                    this.Contact.UserId = dr["UserName"].ToString();
                    this.Contact.Password = dr["Password"].ToString();
                    this.Contact.Initials = dr["Initials"].ToString();

                }

            }
        }
        
        public IDataReader ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        public Mobile Mobile
        {
            get { return m_Mobile; }
            set { m_Mobile = value; }
        }
        public Contact Contact
        {
            get { return m_Contact; }
            set { m_Contact = value; }
        }
        public Address Address
        {
            get { return m_Address; }
            set { m_Address = value; }
        }
        public IDataReader Get(string strUserName, string strPassword)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
           return Mobile.GetMobileByUser(strUserName, strPassword);

        }
        public IDataReader GetMobileByName(string strMobileName)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            this.ResultSet = Mobile.GetMobileByName(strMobileName);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public IDataReader GetMobileContactByRoleId(int nMobileId, int nRoleId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            this.ResultSet = Mobile.GetMobileContactByRoleId(nMobileId, nRoleId);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMobileContact(int nMobileId, int nRoleId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobileContact(nMobileId, nRoleId);

        }
        public DataSet GetMobilesByName(string strMobileName)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesByName(strMobileName);
        }
        public DataSet GetMobilesByUserName(string strUserName, string strPassword)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesByUserName(strUserName, strPassword);
        }
        public DataSet GetMobilesByUserName(string strUserName)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesByUserName(strUserName);
        }

        public DataSet GetNewMobileAccount()
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetNewMobileAccount();
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMobilesByDistrictId(int nDistrictId, string strMobileName)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesByDistrictId(nDistrictId, strMobileName);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMobileByKitchenId(int nKitchenId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobileByKitchenId(nKitchenId);

        }
        public IDataReader GetMobileLimitByDistrictId(int nDistrictId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            this.ResultSet = Mobile.GetMobileLimitByDistrictId(nDistrictId);
            return this.ResultSet;
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMobilesBySOPGroup(int nGroupId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesBySOPGroup(nGroupId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMobilesByChecklistGroup(int nGroupId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesByCheckListGroup(nGroupId);

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMobilesByTypeId()
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobilesByTypeId();

        }
        public DataSet GetMobileTemperatureRangeByMobileId(int nMobileId, int nLogId)
        {
            GetMobileByUserName Mobile = new GetMobileByUserName();
            return Mobile.GetMobileTemperatureRangeByMobileId(nMobileId, nLogId);

        }



    }
}
