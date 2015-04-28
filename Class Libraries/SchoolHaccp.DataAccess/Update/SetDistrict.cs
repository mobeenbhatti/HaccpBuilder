using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
  public  class SetDistrict: DataAccessBase
	{
        private District  m_District;
        private Contact m_Contact;
        private Address m_Address;

        public SetDistrict()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateDistrictById.ToString();
		}

		public void Update()
		{
            
            CreateDistrictDataParameters setParameters = new CreateDistrictDataParameters(this.m_District,this.m_Contact,this.m_Address);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(setParameters.Parameters); 
           
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
            object[] parameters = new object[21];
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
            parameters[13] = this.Address.AddressId;
            parameters[14] = this.Conatact.ContactId;
            parameters[15] = this.District.Reports;
            parameters[16] = this.District.TypeId;
            parameters[17] = this.Address.TimeZone;
            parameters[18] = this.Address.Country;
            parameters[19] = this.Conatact.PasswordSalt;
            parameters[20] = this.Conatact.IsUpdated;
            
           
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

