using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateMobile : DataAccessBase
    {
        private Mobile m_Mobile;
        private Contact m_Contact;
        private Address m_Address;

        public CreateMobile()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_CreateMobile.ToString();
        }

        public void Insert()
        {

            CreateMobileDataParameters createParameters = new CreateMobileDataParameters(this.m_Mobile, this.m_Contact, this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

        }
        public void Insert(string strMode)
        {

            object[] parameters = new object[26];
            parameters[0] = this.Mobile.KitchenId;
            parameters[1] = this.Mobile.Name;
            parameters[2] = this.Mobile.TemperatureLog;
            parameters[3] = this.Mobile.HotHoldingLog;
            parameters[4] = this.Mobile.ColdHoldingLog;
            parameters[5] = this.Mobile.ReceivingLog;
            parameters[6] = this.Mobile.FreezerLog;
            parameters[7] = this.Mobile.RefrigerationLog;
            parameters[8] = this.Mobile.FoodSafetyCheckList;
            parameters[9] = this.Mobile.Thermometer;
            parameters[10] = this.Conatact.Name;
            parameters[11] = this.Conatact.Email;
            parameters[12] = this.Conatact.Phone;
            parameters[13] = this.Conatact.AltPhone;
            parameters[14] = this.Conatact.Fax;
            parameters[15] = this.Conatact.EmailAlerts;
            parameters[16] = this.Conatact.UserId;
            parameters[17] = this.Conatact.Password;
            parameters[18] = this.Address.AddressOne;
            parameters[19] = this.Address.AddressTwo;
            parameters[20] = this.Address.City;
            parameters[21] = this.Address.State;
            parameters[22] = this.Address.ZipCode;
            parameters[23] = this.Address.County;
            parameters[24] = this.Mobile.MobileId;
            parameters[25] = this.Conatact.phpUserId;
            DataServices dataServices = new DataServices("uspAdm_CreateMobilePHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        public void CreateMobileChecklist(int MobileId,int ChecklistId, int AlertStatus)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[3];
            parameters[0] = MobileId;
            parameters[1] = ChecklistId;
            parameters[2] = AlertStatus;
            object returnValue = dataServices.ExecuteScalar("uspAdm_InsertMobileCheckList", parameters);
        }
        public void CopyMobile()
        {
            object[] parameters = new object[32];
            parameters[0] = this.Mobile.KitchenId;
            parameters[1] = this.Mobile.Name;
            parameters[2] = this.Mobile.TemperatureLog;
            parameters[3] = this.Mobile.HotHoldingLog;
            parameters[4] = this.Mobile.ColdHoldingLog;
            parameters[5] = this.Mobile.ReceivingLog;
            parameters[6] = this.Mobile.FreezerLog;
            parameters[7] = this.Mobile.RefrigerationLog;
            parameters[8] = this.Mobile.FoodSafetyCheckList;
            parameters[9] = this.Mobile.Thermometer;
            parameters[10] = this.Conatact.Name;
            parameters[11] = this.Conatact.Email;
            parameters[12] = this.Conatact.Phone;
            parameters[13] = this.Conatact.AltPhone;
            parameters[14] = this.Conatact.Fax;
            parameters[15] = this.Conatact.EmailAlerts;
            parameters[16] = this.Conatact.UserId;
            parameters[17] = this.Conatact.Password;
            parameters[18] = this.Address.AddressOne;
            parameters[19] = this.Address.AddressTwo;
            parameters[20] = this.Address.City;
            parameters[21] = this.Address.State;
            parameters[22] = this.Address.ZipCode;
            parameters[23] = this.Mobile.MobileId;
            parameters[24] = this.Mobile.Ingredients;
            parameters[25] = this.Mobile.MenuItems;
            parameters[26] = this.Mobile.Vendors;
            parameters[27] = this.Mobile.Reports;            
            parameters[28] = this.Mobile.Active;
            parameters[29] = this.Mobile.FreezerNewLog;
            parameters[30] = this.Mobile.ShippingLog;
            parameters[31] = this.Address.TimeZone;
            DataServices dataServices = new DataServices("uspAdm_CopyMobile");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }        

        public Mobile Mobile
        {
            get { return m_Mobile; }
            set { m_Mobile = value; }
        }
        public Contact Conatact
        {
            get
            {
                return this.m_Contact;
            }
            set
            {
                this.m_Contact = value;
            }
        }
        public Address Address
        {
            get
            {
                return this.m_Address;
            }
            set
            {
                this.m_Address = value;
            }
        }
    }

    public class CreateMobileDataParameters
    {
        private Mobile m_Mobile;
        private Contact m_Contact;
        private Address m_Address;
        object[] m_Parameters;

        public CreateMobileDataParameters(Mobile Mobile, Contact contact, Address address)
        {
            this.m_Mobile = Mobile;
            this.m_Contact = contact;
            this.m_Address = address;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[83];
            parameters[0] = this.Mobile.KitchenId;
            parameters[1] = this.Mobile.Name;
            parameters[2] = this.Mobile.TemperatureLog;
            parameters[3] = this.Mobile.TemperatureLogAlert;
            parameters[4] = this.Mobile.TemperatureLogMax;
            parameters[5] = this.Mobile.TemperatureLogMin;
            parameters[6] = this.Mobile.HotHoldingLog;
            parameters[7] = this.Mobile.HotHoldingLogAlert;
            parameters[8] = this.Mobile.HotHoldingLogMax;
            parameters[9] = this.Mobile.HotHoldingLogMin;
            parameters[10] = this.Mobile.ColdHoldingLog;
            parameters[11] = this.Mobile.ColdHoldingLogAlert;
            parameters[12] = this.Mobile.ColdHoldingLogMax;
            parameters[13] = this.Mobile.ColdHoldingLogMin;
            parameters[14] = this.Mobile.ReceivingLog;
            parameters[15] = this.Mobile.ReceivingLogAlert;
            parameters[16] = this.Mobile.ReceivingLogMax;
            parameters[17] = this.Mobile.ReceivingLogMin;
            parameters[18] = this.Mobile.FreezerLog;
            parameters[19] = this.Mobile.FreezerLogAlert;
            parameters[20] = this.Mobile.FreezerLogMax;
            parameters[21] = this.Mobile.FreezerLogMin;
            parameters[22] = this.Mobile.RefrigerationLog;
            parameters[23] = this.Mobile.RefrigerationLogAlert;
            parameters[24] = this.Mobile.RefrigerationLogMax;
            parameters[25] = this.Mobile.RefrigerationLogMin;
            parameters[26] = this.Mobile.FoodSafetyCheckList;
            parameters[27] = this.Mobile.FoodSafetyCheckListAlert;
            parameters[28] = this.Mobile.Thermometer;
            parameters[29] = this.Mobile.ThermometerAlert;
            parameters[30] = this.Mobile.ThermometerMax;
            parameters[31] = this.Mobile.ThermometerMin;
            parameters[32] = this.Mobile.Validation;
            parameters[33] = this.Mobile.ValidationAlert;
            parameters[34] = this.Conatact.Name;
            parameters[35] = this.Conatact.Email;
            parameters[36] = this.Conatact.Phone;
            parameters[37] = this.Conatact.AltPhone;
            parameters[38] = this.Conatact.Fax;
            parameters[39] = this.Conatact.EmailAlerts;
            parameters[40] = this.Conatact.UserId;
            parameters[41] = this.Conatact.Password;
            parameters[42] = this.Address.AddressOne;
            parameters[43] = this.Address.AddressTwo;
            parameters[44] = this.Address.City;
            parameters[45] = this.Address.State;
            parameters[46] = this.Address.ZipCode;
            parameters[47] = this.Mobile.Ingredients;
            parameters[48] = this.Mobile.MenuItems;
            parameters[49] = this.Mobile.Vendors;
            parameters[50] = this.Mobile.Reports;            
            parameters[51] = this.Mobile.Active;
            parameters[52] = this.Mobile.FreezerNewLog;
            parameters[53] = this.Mobile.FreezerNewLogAlert;
            parameters[54] = this.Mobile.FreezerNewLogMax;
            parameters[55] = this.Mobile.FreezerNewLogMin;
            parameters[56] = this.Mobile.ShippingLog;
            parameters[57] = this.Mobile.ShippingLogAlert;
            parameters[58] = this.Mobile.ShippingLogMax;
            parameters[59] = this.Mobile.ShippingLogMin;
            parameters[60] = this.Address.TimeZone;
            parameters[61] = this.Conatact.Initials;
            parameters[62] = this.Mobile.PhLog;
            parameters[63] = this.Mobile.PhLogAlert;
            parameters[64] = this.Mobile.PhLogMax;
            parameters[65] = this.Mobile.PhLogMin;
            parameters[66] = this.Mobile.PestLog;
            parameters[67] = this.Mobile.PestLogAlert;
            parameters[68] = this.Mobile.PestLogMax;
            parameters[69] = this.Mobile.PestLogMin;
            parameters[70] = this.Mobile.MaintenanceLog;
            parameters[71] = this.Mobile.MaintenanceLogAlert;
            parameters[72] = this.Mobile.MaintenanceLogMax;
            parameters[73] = this.Mobile.MaintenanceLogMin;
            parameters[74] = this.Mobile.CleaningLog;
            parameters[75] = this.Mobile.CleaningLogAlert;
            parameters[76] = this.Mobile.CleaningLogMax;
            parameters[77] = this.Mobile.CleaningLogMin;
            parameters[78] = this.Address.Country;
            parameters[79] = this.Mobile.CheckList;
            parameters[80] = this.Mobile.CheckListAlert;
            parameters[81] = this.Conatact.PasswordSalt;
            parameters[82] = this.Conatact.IsUpdated;

            //        @nDistrictId INT
            //,@chMobileName VARCHAR(200)
            //,@nTemperatureLog INT
            //,@nHotHoldingLog INT
            //,@nColdHoldingLog INT
            //,@nReceivingLog INT
            //,@nFreezserLog INT
            //,@nRefrigerationLog INT
            //,@nFoodSafetyChecklist INT
            //,@nThermometer INT
            //---------------------------
            //-- Contact Table Parameters
            //---------------------------
            //,@vchManagerName VARCHAR(200)
            //,@vchEmail VARCHAR(200)
            //,@vchAddressOne VARCHAR(200)
            //,@vchAddressTwo VARCHAR(200)
            //,@chCity CHAR(100)
            //,@chState CHAR(100)
            //,@vchZipCode VARCHAR(50)
            //,@vchPhone VARCHAR(50)
            //,@vchAltPhone VARCHAR(50)
            //,@vchFax VARCHAR(50)
            //,@nEmailAlert BIT
            Parameters = parameters;
        }

        public Mobile Mobile
        {
            get { return m_Mobile; }
            set { m_Mobile = value; }
        }
        public Contact Conatact
        {
            get
            {
                return this.m_Contact;
            }
            set
            {
                this.m_Contact = value;
            }
        }
        public Address Address
        {
            get
            {
                return this.m_Address;
            }
            set
            {
                this.m_Address = value;
            }
        }
        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
