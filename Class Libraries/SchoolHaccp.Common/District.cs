using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class District
    {        
        private int m_DistrictId;
        private string m_AccountNumber;
        private string m_Name;
        private int m_NumberOfKitchens;
        private string m_DistrictType;
        private int m_DistrictPrinting;
        private int m_Active;
        private int m_Reports;
        private int m_TypeId;
        

        
        public int DistrictId
        {
            get { return m_DistrictId; }
            set { m_DistrictId = value; }
        }
        public string AccountNumber
        {
            get { return m_AccountNumber; }
            set { m_AccountNumber = value; }
        }
        public int Active
        {
            get { return m_Active; }
            set { m_Active = value; }
        }
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }
        public int NumberOfKitchens
        {
            get { return m_NumberOfKitchens; }
            set { m_NumberOfKitchens = value; }
        }
        public string DistrictType
        {
            get { return m_DistrictType; }
            set { m_DistrictType = value; }
        }
        public int DistrictPrinting
        {
            get { return m_DistrictPrinting; }
            set { m_DistrictPrinting = value; }
        }
        public int Reports
        {
            get { return m_Reports; }
            set { m_Reports = value; }
        }
        public int TypeId
        {
            get { return m_TypeId; }
            set { m_TypeId = value; }
        }
        
    }
}
