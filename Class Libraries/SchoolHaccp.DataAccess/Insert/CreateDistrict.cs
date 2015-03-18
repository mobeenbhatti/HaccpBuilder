using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert
{
  public  class CreateDistrict: DataAccessBase
	{
        private District  m_District;
        private Contact m_Contact;
        private Address m_Address;

        public CreateDistrict()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_CreateDistrict.ToString();
		}

		public void Insert()
		{
            
            CreateDistrictDataParameters createParameters = new CreateDistrictDataParameters(this.m_District,this.m_Contact,this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        public void Insert(string strMode)
        {
            object[] parameters = new object[20];
            parameters[0] = this.District.Name;
            parameters[1] = this.District.DistrictPrinting;
            parameters[2] = this.District.DistrictType;
            parameters[3] = this.District.NumberOfKitchens;
            parameters[4] = this.District.Active;
            parameters[5] = this.Address.City;
            parameters[6] = this.Address.State;
            parameters[7] = this.Address.ZipCode;
            parameters[8] = this.Conatact.Email;
            parameters[9] = this.Conatact.Name;
            parameters[10] = this.Conatact.Password;
            parameters[11] = this.Conatact.UserId;
            parameters[12] = this.District.DistrictId;
            parameters[13] = this.Address.County;
            parameters[14] = this.Conatact.AltPhone;
            parameters[15] = this.Conatact.Fax;
            parameters[16] = this.Conatact.Phone;
            parameters[17] = this.Address.AddressOne;
            parameters[18] = this.Address.AddressTwo;
            parameters[19] = this.Conatact.phpUserId;
            DataServices dataServices = new DataServices("uspAdm_CreateDistrictPHP");
            object returnValue = dataServices.ExecuteScalar(parameters); 
        }

        public void CopyDistrict()
        {
            object[] parameters = new object[24];
            //parameters[0] = this.District.DistrictId;
            //parameters[1] = this.District.Name;
            //parameters[2] = this.District.TemperatureLog;
            //parameters[3] = this.District.HotHoldingLog;
            //parameters[4] = this.District.ColdHoldingLog;
            //parameters[5] = this.District.ReceivingLog;
            //parameters[6] = this.District.FreezerLog;
            //parameters[7] = this.District.RefrigerationLog;
            //parameters[8] = this.District.FoodSafetyCheckList;
            //parameters[9] = this.District.Thermometer;
            //parameters[10] = this.Conatact.Name;
            //parameters[11] = this.Conatact.Email;
            //parameters[12] = this.Conatact.Phone;
            //parameters[13] = this.Conatact.AltPhone;
            //parameters[14] = this.Conatact.Fax;
            //parameters[15] = this.Conatact.EmailAlerts;
            //parameters[16] = this.Conatact.UserId;
            //parameters[17] = this.Conatact.Password;
            //parameters[18] = this.Address.AddressOne;
            //parameters[19] = this.Address.AddressTwo;
            //parameters[20] = this.Address.City;
            //parameters[21] = this.Address.State;
            //parameters[22] = this.Address.ZipCode;
            //parameters[23] = this.District.DistrictId;
            DataServices dataServices = new DataServices("uspAdm_CopyDistrict");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public District District
		{
            get { return m_District; }
            set { m_District = value; }
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

	public class CreateDistrictDataParameters
	{
		private District m_District;
        private Contact m_Contact;
        private Address m_Address;
		object[] m_Parameters;

        public CreateDistrictDataParameters(District District,Contact contact,Address address)
		{
            this.m_District = District;
            this.m_Contact = contact;
            this.m_Address = address;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[16];
            parameters[0] = this.District.Name;
            parameters[1] = this.District.DistrictPrinting;
            parameters[2] = this.District.DistrictType;
            parameters[3] = this.District.NumberOfKitchens;
            parameters[4] = this.District.Active;
            parameters[5] = this.Address.City;
            parameters[6] = this.Address.State;
            parameters[7] = this.Address.ZipCode;
            parameters[8] = this.Conatact.Email;
            parameters[9] = this.Conatact.Name;
            parameters[10] = this.Conatact.Password;
            parameters[11] = this.Conatact.UserId;
            parameters[12] = this.District.Reports;
            parameters[13] = this.District.TypeId;
            parameters[14] = this.Address.TimeZone;
            parameters[15] = this.Address.Country;

    //        @nDistrictId INT
    //,@chDistrictName VARCHAR(200)
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

        public District District
        {
            get { return m_District; }
            set { m_District = value; }
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

