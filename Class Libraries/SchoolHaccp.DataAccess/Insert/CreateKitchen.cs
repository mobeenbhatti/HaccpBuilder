using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
  public  class CreateKitchen: DataAccessBase
	{
        private Kitchen  m_Kitchen;
        private Contact m_Contact;
        private Address m_Address;

        public CreateKitchen()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_CreateKitchen.ToString();
		}

		public void Insert()
		{
            
            CreateKitchenDataParameters createParameters = new CreateKitchenDataParameters(this.m_Kitchen,this.m_Contact,this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);           
           
		}
        public int Create()
        {

            CreateKitchenDataParameters createParameters = new CreateKitchenDataParameters(this.m_Kitchen, this.m_Contact, this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            if (returnValue != null)
                return (int)returnValue;
            else
                return 0;

        }
        public void Insert(string strMode)
        {

            object[] parameters = new object[28];
            parameters[0] = this.Kitchen.DistrictId;
            parameters[1] = this.Kitchen.Name;
            parameters[2] = this.Kitchen.TemperatureLog;
            parameters[3] = this.Kitchen.HotHoldingLog;
            parameters[4] = this.Kitchen.ColdHoldingLog;
            parameters[5] = this.Kitchen.ReceivingLog;
            parameters[6] = this.Kitchen.FreezerLog;
            parameters[7] = this.Kitchen.RefrigerationLog;
            parameters[8] = this.Kitchen.FoodSafetyCheckList;
            parameters[9] = this.Kitchen.Thermometer;
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
            parameters[24] = this.Kitchen.KitchenId;
            parameters[25] = this.Conatact.phpUserId;
            parameters[26] = this.Conatact.PasswordSalt;
            parameters[27] = this.Conatact.IsUpdated;
            DataServices dataServices = new DataServices("uspAdm_CreateKitchenPHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        public void CopyKitchen()
        {
            object[] parameters = new object[41];
            parameters[0] = this.Kitchen.DistrictId;
            parameters[1] = this.Kitchen.Name;
            parameters[2] = this.Kitchen.TemperatureLog;
            parameters[3] = this.Kitchen.HotHoldingLog;
            parameters[4] = this.Kitchen.ColdHoldingLog;
            parameters[5] = this.Kitchen.ReceivingLog;
            parameters[6] = this.Kitchen.FreezerLog;
            parameters[7] = this.Kitchen.RefrigerationLog;
            parameters[8] = this.Kitchen.FoodSafetyCheckList;
            parameters[9] = this.Kitchen.Thermometer;
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
            parameters[23] = this.Kitchen.KitchenId;
            parameters[24] = this.Kitchen.Ingredients;
            parameters[25] = this.Kitchen.MenuItems;
            parameters[26] = this.Kitchen.Vendors;
            parameters[27] = this.Kitchen.Reports;
            parameters[28] = this.Kitchen.Kitchentype;
            parameters[29] = this.Kitchen.Active;
            parameters[30] = this.Kitchen.FreezerNewLog;
            parameters[31] = this.Kitchen.ShippingLog;
            parameters[32] = this.Address.TimeZone;
            parameters[33] = this.Kitchen.PhLog;
            parameters[34] = this.Kitchen.PestLog;
            parameters[35] = this.Kitchen.MaintenanceLog;
            parameters[36] = this.Kitchen.CleaningLog;
            parameters[37] = this.Kitchen.CheckList;
            parameters[38] = this.Address.Country;
            parameters[39] = this.Conatact.PasswordSalt;
            parameters[40] = this.Conatact.IsUpdated;
            DataServices dataServices = new DataServices("uspAdm_CopyKitchen");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        public void CreateKitchenContact()
        {
            object[] parameters = new object[18];
           
            parameters[0] = this.Conatact.Name;
            parameters[1] = this.Conatact.Email;
            parameters[2] = this.Conatact.Phone;
            parameters[3] = this.Conatact.AltPhone;
            parameters[4] = this.Conatact.Fax;
            parameters[5] = this.Conatact.EmailAlerts;
            parameters[6] = this.Conatact.UserId;
            parameters[7] = this.Conatact.Password;
            parameters[8] = this.Address.AddressOne;
            parameters[9] = this.Address.AddressTwo;
            parameters[10] = this.Address.City;
            parameters[11] = this.Address.State;
            parameters[12] = this.Address.ZipCode;
            parameters[13] = this.Kitchen.KitchenId;
            parameters[14] = this.Conatact.Initials;
            parameters[15] = this.Address.TimeZone;
            parameters[16] = this.Conatact.PasswordSalt;
            parameters[17] = this.Conatact.IsUpdated;
            DataServices dataServices = new DataServices("uspAdm_InsertKitchenContact");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }
        
        public Kitchen Kitchen
		{
            get { return m_Kitchen; }
            set { m_Kitchen = value; }
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

	public class CreateKitchenDataParameters
	{
		private Kitchen m_Kitchen;
        private Contact m_Contact;
        private Address m_Address;
		object[] m_Parameters;

        public CreateKitchenDataParameters(Kitchen kitchen,Contact contact,Address address)
		{
            this.m_Kitchen = kitchen;
            this.m_Contact = contact;
            this.m_Address = address;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[83];
            parameters[0] = this.Kitchen.DistrictId;
            parameters[1] = this.Kitchen.Name;
            parameters[2] = this.Kitchen.TemperatureLog;
            parameters[3] = this.Kitchen.TemperatureLogAlert;
            parameters[4] = this.Kitchen.TemperatureLogMax;
            parameters[5] = this.Kitchen.TemperatureLogMin;
            parameters[6] = this.Kitchen.HotHoldingLog;
            parameters[7] = this.Kitchen.HotHoldingLogAlert;
            parameters[8] = this.Kitchen.HotHoldingLogMax;
            parameters[9] = this.Kitchen.HotHoldingLogMin;
            parameters[10] = this.Kitchen.ColdHoldingLog;
            parameters[11] = this.Kitchen.ColdHoldingLogAlert;
            parameters[12] = this.Kitchen.ColdHoldingLogMax;
            parameters[13] = this.Kitchen.ColdHoldingLogMin;
            parameters[14] = this.Kitchen.ReceivingLog;
            parameters[15] = this.Kitchen.ReceivingLogAlert;
            parameters[16] = this.Kitchen.ReceivingLogMax;
            parameters[17] = this.Kitchen.ReceivingLogMin;
            parameters[18] = this.Kitchen.FreezerLog;
            parameters[19] = this.Kitchen.FreezerLogAlert;
            parameters[20] = this.Kitchen.FreezerLogMax;
            parameters[21] = this.Kitchen.FreezerLogMin;
            parameters[22] = this.Kitchen.RefrigerationLog;
            parameters[23] = this.Kitchen.RefrigerationLogAlert;
            parameters[24] = this.Kitchen.RefrigerationLogMax;
            parameters[25] = this.Kitchen.RefrigerationLogMin;
            parameters[26] = this.Kitchen.FoodSafetyCheckList;
            parameters[27] = this.Kitchen.FoodSafetyCheckListAlert;
            parameters[28] = this.Kitchen.Thermometer;
            parameters[29] = this.Kitchen.ThermometerAlert;
            parameters[30] = this.Kitchen.ThermometerMax;
            parameters[31] = this.Kitchen.ThermometerMin;
            parameters[32]=this.Kitchen.Validation;
            parameters[33]=this.Kitchen.ValidationAlert;
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
            parameters[47] = this.Kitchen.Ingredients;
            parameters[48] = this.Kitchen.MenuItems;
            parameters[49] = this.Kitchen.Vendors;
            parameters[50] = this.Kitchen.Reports;
            parameters[51] = this.Kitchen.Kitchentype;
            parameters[52] = this.Kitchen.Active;
            parameters[53] = this.Kitchen.FreezerNewLog;
            parameters[54] = this.Kitchen.FreezerNewLogAlert;
            parameters[55] = this.Kitchen.FreezerNewLogMax;
            parameters[56] = this.Kitchen.FreezerNewLogMin;
            parameters[57] = this.Kitchen.ShippingLog;
            parameters[58] = this.Kitchen.ShippingLogAlert;
            parameters[59] = this.Kitchen.ShippingLogMax;
            parameters[60] = this.Kitchen.ShippingLogMin;
            parameters[61] = this.Address.TimeZone;
            parameters[62] = this.Kitchen.PhLog;
            parameters[63] = this.Kitchen.PhLogAlert;
            parameters[64] = this.Kitchen.PhLogMax;
            parameters[65] = this.Kitchen.PhLogMin;
            parameters[66] = this.Kitchen.PestLog;
            parameters[67] = this.Kitchen.PestLogAlert;
            parameters[68] = this.Kitchen.PestLogMax;
            parameters[69] = this.Kitchen.PestLogMin;
            parameters[70] = this.Kitchen.MaintenanceLog;
            parameters[71] = this.Kitchen.MaintenanceLogAlert;
            parameters[72] = this.Kitchen.MaintenanceLogMax;
            parameters[73] = this.Kitchen.MaintenanceLogMin;
            parameters[74] = this.Kitchen.CleaningLog; ;
            parameters[75] = this.Kitchen.CleaningLogAlert;
            parameters[76] = this.Kitchen.CleaningLogMax;
            parameters[77] = this.Kitchen.CleaningLogMin;
            parameters[78] = this.Kitchen.CheckList; ;
            parameters[79] = this.Kitchen.CheckListAlert;
            parameters[80] = this.Address.Country;
            parameters[81] = this.Conatact.PasswordSalt;
            parameters[82] = this.Conatact.IsUpdated;
            
    //        @nDistrictId INT
    //,@chKitchenName VARCHAR(200)
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

        public Kitchen Kitchen
        {
            get { return m_Kitchen; }
            set { m_Kitchen = value; }
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

