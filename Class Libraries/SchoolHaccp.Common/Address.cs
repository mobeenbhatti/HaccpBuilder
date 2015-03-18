using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class Address
    {
        private string m_Name;
        private string m_AddressOne;
        private string m_AddressTwo;
        private string m_City;        
        private string m_State;
        private string m_ZipCode;
        private int m_AddressId;
        private string m_County;
        private string m_Country;
        private string m_TimeZone;

        public int AddressId
        {
            get
            {
                return this.m_AddressId;
            }
            set
            {
                this.m_AddressId = value;
            }
        }
       

        public string AddressOne
        {
            get
            {
                return this.m_AddressOne;
            }
            set
            {
                this.m_AddressOne = value;
            }
        }

        public string AddressTwo
        {
            get
            {
                return this.m_AddressTwo;
            }
            set
            {
                this.m_AddressTwo = value;
            }
        }        

        public string City
        {
            get
            {
                return this.m_City;
            }
            set
            {
                this.m_City = value;
            }
        }
        public string County
        {
            get
            {
                return m_County;
            }
            set
            {
                m_County = value;
            }
        }
        public string Country
        {
            get
            {
                return m_Country;
            }
            set
            {
                m_Country = value;
            }
        }
        
        public string Name
        {
            get
            {
                return this.m_Name;
            }
            set
            {
                this.m_Name = value;
            }
        }
        
        public string State
        {
            get
            {
                return m_State;
            }
            set
            {
                this.m_State = value;
            }
        }
        public string TimeZone
        {
            get
            {
                return m_TimeZone;
            }
            set
            {
                this.m_TimeZone = value;
            }
        }

        public string ZipCode
        {
            get
            {
                return m_ZipCode;
            }
            set
            {
                this.m_ZipCode = value;
            }
        }
    }
}
