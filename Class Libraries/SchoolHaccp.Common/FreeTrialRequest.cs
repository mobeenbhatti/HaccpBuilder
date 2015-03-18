using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
	public class FreeTrialRequest
	{
        private string m_DistrictName;
        private string m_FirstName;
        private string m_LastName;
        private string m_Title;
        private int m_NumberOfKitchens;
        private string m_EmailAddress;
        private string m_PhoneNumber;
        private string m_City;
        private string m_State;
        private string m_ZipCode;
        private string m_Comments;
        private string m_FreeTrialRequestId;
        private int m_SponsorId;
        private string m_Country;
        private int m_TypeId;
          

        public string FreeTrialRequestId
        {
            get { return m_FreeTrialRequestId; }
            set { m_FreeTrialRequestId = value; }
        }
        public string DistrictName
        {
            get { return m_DistrictName; }
            set { m_DistrictName = value; }
        }
        public string FirstName
        {
            get { return m_FirstName; }
            set { m_FirstName = value; }
        }
        public string LastName
        {
            get { return m_LastName; }
            set { m_LastName = value; }
        }
        public string Title
        {
            get { return m_Title; }
            set { m_Title = value; }
        }
        public int NumberOfKitchens
        {
            get { return m_NumberOfKitchens; }
            set { m_NumberOfKitchens = value; }
        }
        public string EmailAddress
        {
            get { return m_EmailAddress; }
            set { m_EmailAddress = value; }
        }
        public string PhoneNumber
        {
            get { return m_PhoneNumber; }
            set { m_PhoneNumber = value; }
        }
        public string Country
        {
            get { return m_Country; }
            set { m_Country = value; }
        }
        public string City
        {
            get { return m_City; }
            set { m_City = value; }
        }
        public string State
        {
            get { return m_State; }
            set { m_State = value; }
        }
        public string ZipCode
        {
            get { return m_ZipCode; }
            set { m_ZipCode = value; }
        }
        public string Comments
        {
            get { return m_Comments; }
            set { m_Comments = value; }
        }
        /// <summary>
        /// 1 - For HaccpBuilder
        /// 2 - For CaterTrax 
        /// </summary>
        public int SponsorId
        {
            get { return m_SponsorId; }
            set { m_SponsorId = value; }
        }
        /// <summary>
        /// 0 - For Normal Account
        /// 1 - For C-TPAT 
        /// </summary>
        public int TypeId
        {
            get { return m_TypeId; }
            set { m_TypeId = value; }
        }
	}
}
