using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    public class SetMobile : DataAccessBase
    {
        private Mobile m_Mobile;
        private Contact m_Contact;
        private Address m_Address;

        public SetMobile()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateMobileById.ToString();
        }

        public void Update()
        {

            CreateMobileDataParameters setParameters = new CreateMobileDataParameters(this.m_Mobile, this.m_Contact, this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(setParameters.Parameters);

        }
        public void UpdateMobileContact()
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
            parameters[13] = this.Mobile.MobileId;
            parameters[14] = this.Address.AddressId;
            parameters[15] = this.Conatact.ContactId;
            parameters[16] = this.Conatact.Active;
            parameters[17] = this.Conatact.Initials;
            parameters[18] = this.Address.TimeZone;
            DataServices dataServices = new DataServices("uspAdm_UpdateMobileContact");
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
            object[] parameters = new object[84];
            parameters[0] = this.Mobile.KitchenId;
            parameters[1] = this.Conatact.Name;
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
            parameters[47] = this.Mobile.MobileId;
            parameters[48] = this.Address.AddressId;
            parameters[49] = this.Conatact.ContactId;
            parameters[50] = this.Mobile.Ingredients;
            parameters[51] = this.Mobile.MenuItems;
            parameters[52] = this.Mobile.Vendors;
            parameters[53] = this.Mobile.Reports;           
            parameters[54] = this.Mobile.Active;
            parameters[55] = this.Mobile.FreezerNewLog;
            parameters[56] = this.Mobile.FreezerNewLogAlert;
            parameters[57] = this.Mobile.FreezerNewLogMax;
            parameters[58] = this.Mobile.FreezerNewLogMin;
            parameters[59] = this.Mobile.ShippingLog;
            parameters[60] = this.Mobile.ShippingLogAlert;
            parameters[61] = this.Mobile.ShippingLogMax;
            parameters[62] = this.Mobile.ShippingLogMin;
            parameters[63] = this.Address.TimeZone;
            parameters[64] = this.Conatact.Initials;
            parameters[65] = this.Mobile.PhLog;
            parameters[66] = this.Mobile.PhLogAlert;
            parameters[67] = this.Mobile.PhLogMax;
            parameters[68] = this.Mobile.PhLogMin;
            parameters[69] = this.Mobile.PestLog;
            parameters[70] = this.Mobile.PestLogAlert;
            parameters[71] = this.Mobile.PestLogMax;
            parameters[72] = this.Mobile.PestLogMin;
            parameters[73] = this.Mobile.MaintenanceLog;
            parameters[74] = this.Mobile.MaintenanceLogAlert;
            parameters[75] = this.Mobile.MaintenanceLogMax;
            parameters[76] = this.Mobile.MaintenanceLogMin;
            parameters[77] = this.Mobile.CleaningLog;
            parameters[78] = this.Mobile.CleaningLogAlert;
            parameters[79] = this.Mobile.CleaningLogMax;
            parameters[80] = this.Mobile.CleaningLogMin;
            parameters[81] = this.Address.Country;
            parameters[82] = this.m_Mobile.CheckList;
            parameters[83] = this.m_Mobile.CheckListAlert;

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
