using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
  public  class SetKitchen: DataAccessBase
	{
        private Kitchen  m_Kitchen;
        private Contact m_Contact;
        private Address m_Address;

        public SetKitchen()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateKitchenById.ToString();
		}

		public void Update()
		{
            
            CreateKitchenDataParameters setParameters = new CreateKitchenDataParameters(this.m_Kitchen,this.m_Contact,this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(setParameters.Parameters); 
           
		}
        public void UpdateKitchenContact()
        {

            object[] parameters = new object[19];

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
            parameters[14] = this.Address.AddressId;
            parameters[15] = this.Conatact.ContactId;
            parameters[16] = this.Conatact.Active;
            parameters[17] = this.Conatact.Initials;
            parameters[18] = this.Address.TimeZone;
            DataServices dataServices = new DataServices("uspAdm_UpdateKitchenContact");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public void UpdateKitchenTimeZone(int nKitchenId, string strTimeZone)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];            
            parameters[0] = nKitchenId;
            parameters[1] = strTimeZone;
            object returnValue = dataServices.ExecuteScalar("uspAdm_UpdateKitchenTimeZoneByKitchenId", parameters);
        }
        public void UpdateKitchenLogo(int nKitchenId, string strFileName)
        {
            DataServices dataServices = new DataServices();
            object[] parameters = new object[2];
            parameters[0] = nKitchenId;
            parameters[1] = strFileName;
            object returnValue = dataServices.ExecuteScalar("uspAdm_UpdateKitchenLogoByKitchenId", parameters);
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
            object[] parameters = new object[84];
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
            parameters[32] = this.Kitchen.Validation;
            parameters[33] = this.Kitchen.ValidationAlert;
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
            parameters[47] = this.Kitchen.KitchenId;
            parameters[48] = this.Address.AddressId;
            parameters[49] = this.Conatact.ContactId;
            parameters[50] = this.Kitchen.Ingredients;
            parameters[51] = this.Kitchen.MenuItems;
            parameters[52] = this.Kitchen.Vendors;
            parameters[53] = this.Kitchen.Reports;
            parameters[54] = this.Kitchen.Kitchentype;
            parameters[55] = this.Kitchen.Active;
            parameters[56] = this.Kitchen.FreezerNewLog;
            parameters[57] = this.Kitchen.FreezerNewLogAlert;
            parameters[58] = this.Kitchen.FreezerNewLogMax;
            parameters[59] = this.Kitchen.FreezerNewLogMin;
            parameters[60] = this.Kitchen.ShippingLog;
            parameters[61] = this.Kitchen.ShippingLogAlert;
            parameters[62] = this.Kitchen.ShippingLogMax;
            parameters[63] = this.Kitchen.ShippingLogMin;
            parameters[64] = this.Address.TimeZone;
            parameters[65] = this.Kitchen.PhLog;
            parameters[66] = this.Kitchen.PhLogAlert;
            parameters[67] = this.Kitchen.PhLogMax;
            parameters[68] = this.Kitchen.PhLogMin;
            parameters[69] = this.Kitchen.PestLog;
            parameters[70] = this.Kitchen.PestLogAlert;
            parameters[71] = this.Kitchen.PestLogMax;
            parameters[72] = this.Kitchen.PestLogMin;
            parameters[73] = this.Kitchen.MaintenanceLog;
            parameters[74] = this.Kitchen.MaintenanceLogAlert;
            parameters[75] = this.Kitchen.MaintenanceLogMax;
            parameters[76] = this.Kitchen.MaintenanceLogMin;
            parameters[77] = this.Kitchen.CleaningLog;
            parameters[78] = this.Kitchen.CleaningLogAlert;
            parameters[79] = this.Kitchen.CleaningLogMax;
            parameters[80] = this.Kitchen.CleaningLogMin;
            parameters[81] = this.Kitchen.CheckList;
            parameters[82] = this.Kitchen.CheckListAlert;
            parameters[83] = this.Address.Country;
            
           
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

