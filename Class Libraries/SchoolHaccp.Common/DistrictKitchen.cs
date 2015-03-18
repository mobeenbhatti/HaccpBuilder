using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    class DistrictKitchen
    {
        private int m_KitchenId;
        private int m_DistrictId;
        private string m_AccountNumber;
        private string m_Name;
        
        private int m_Temnperature;
        private int m_ColdHoldingLog;
        private int m_ReceivingLog;
        private int m_FreezerLog;
        private int m_RefrigerationLog;
        private int m_FoodSafetyCheckList;
        private int m_Thermometer;
        private int m_HotHoldingLog;

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
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
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }

        public int ColdHoldingLog
        {
            get
            {
                return this.m_ColdHoldingLog;
            }
            set
            {
                this.m_ColdHoldingLog = value;
            }
        }

        public int FoodSafetCheckList
        {
            get
            {
                return this.FoodSafetCheckList;
            }
            set
            {
                this.FoodSafetCheckList = value;
            }
        }

        public int FreezerLog
        {
            get
            {
                return this.FreezerLog;
            }
            set
            {
                this.FreezerLog = value;
            }
        }

        public int HotHoldingLog
        {
            get
            {
                return this.HotHoldingLog;
            }
            set
            {
                this.HotHoldingLog = value;
            }
        }

        public int ReceivingLog
        {
            get
            {
                return this.ReceivingLog;
            }
            set
            {
                this.ReceivingLog = value;
            }
        }

        public int RefrigerationLog
        {
            get
            {
                return this.RefrigerationLog;
            }
            set
            {
                this.RefrigerationLog = value;
            }
        }

        public int TemperatureLog
        {
            get
            {
                return this.TemperatureLog;
            }
            set
            {
                this.TemperatureLog = value;
            }
        }

        public int Thermometer
        {
            get
            {
                return this.Thermometer;
            }
            set
            {
                this.Thermometer = value;
            }
        }
    }
}
