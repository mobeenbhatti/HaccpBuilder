using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class Kitchen
    {
        private int m_KitchenId;
        private int m_DistrictId;
        private string m_AccountNumber;
        private string m_Name;

        private int m_TemnperatureLog;
        private int m_TemnperatureLogAlert;
        private float m_TemnperatureLogMax = (float)0;
        private float m_TemnperatureLogMin = (float)0;
        private int m_CheckList;
        private int m_CheckListAlert;
        private int m_CleaningLog;
        private int m_CleaningLogAlert;
        private float m_CleaningLogMax = (float)0;
        private float m_CleaningLogMin = (float)0;
        private int m_ColdHoldingLog;
        private int m_ColdHoldingLogAlert;
        private float m_ColdHoldingLogMax = (float)0;
        private float m_ColdHoldingLogMin = (float)0;
        private int m_ReceivingLog;
        private int m_ReceivingLogAlert;
        private float m_ReceivingLogMax = (float)0;
        private float m_ReceivingLogMin = (float)0;
        private int m_FreezerLog;
        private int m_FreezerLogAlert;
        private float m_FreezerLogMax = (float)0;
        private float m_FreezerLogMin = (float)0;

        private int m_FreezerNewLog;
        private int m_FreezerNewLogAlert;
        private float m_FreezerNewLogMax = (float)0;
        private float m_FreezerNewLogMin = (float)0;

        private int m_RefrigerationLog;
        private int m_RefrigerationLogAlert;
        private float m_RefrigerationLogMax = (float)0;
        private float m_RefrigerationLogMin = (float)0;
        private int m_FoodSafetyCheckList;
        private int m_FoodSafetyCheckListAlert;
        private int m_Thermometer;
        private int m_ThermometerAlert;
        private float m_ThermometerMax = (float)0;
        private float m_ThermometerMin = (float)0;
        private int m_HotHoldingLog;
        private int m_HotHoldingLogAlert;
        private float m_HotHoldingLogMax = (float)0;
        private float m_HotHoldingLogMin = (float)0;
        private int m_ShippingLog;
        private int m_ShippingLogAlert;
        private float m_ShippingLogMax = (float)0;
        private float m_ShippingLogMin = (float)0;

        private int m_PhLog;
        private int m_PhLogAlert;
        private float m_PhLogMax = (float)0;
        private float m_PhLogMin = (float)0;
        private int m_PestLog;
        private int m_PestLogAlert;
        private float m_PestLogMax = (float)0;
        private float m_PestLogMin = (float)0;
        private int m_MaintenanceLog;
        private int m_MaintenanceLogAlert;
        private float m_MaintenanceLogMax = (float)0;
        private float m_MaintenanceLogMin = (float)0;

        private int m_Validation;
        private int m_ValidationAlert;
        private int m_MenuItems;
        private int m_Ingredients;
        private int m_Vendors;
        private int m_Reports;
        private int m_KitchenType;
        private int m_Active;
        

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
            get { return this.m_Name; }
            set { this.m_Name = value; }
        }
        public int CheckList
        {
            get
            {
                return this.m_CheckList;
            }
            set
            {
                this.m_CheckList = value;
            }
        }
        public int CheckListAlert
        {
            get
            {
                return this.m_CheckListAlert;
            }
            set
            {
                this.m_CheckListAlert = value;
            }
        }
        public int CleaningLog
        {
            get
            {
                return this.m_CleaningLog;
            }
            set
            {
                this.m_CleaningLog = value;
            }
        }
        public int CleaningLogAlert
        {
            get
            {
                return this.m_CleaningLogAlert;
            }
            set
            {
                this.m_CleaningLogAlert = value;
            }
        }
        public float CleaningLogMax
        {
            get
            {
                return this.m_CleaningLogMax;
            }
            set
            {
                this.m_CleaningLogMax = value;
            }
        }
        public float CleaningLogMin
        {
            get
            {
                return this.m_CleaningLogMin;
            }
            set
            {
                this.m_CleaningLogMin = value;
            }
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
        public int ColdHoldingLogAlert
        {
            get
            {
                return this.m_ColdHoldingLogAlert;
            }
            set
            {
                this.m_ColdHoldingLogAlert = value;
            }
        }
        public float ColdHoldingLogMax
        {
            get
            {
                return this.m_ColdHoldingLogMax;
            }
            set
            {
                this.m_ColdHoldingLogMax = value;
            }
        }
        public float ColdHoldingLogMin
        {
            get
            {
                return this.m_ColdHoldingLogMin;
            }
            set
            {
                this.m_ColdHoldingLogMin = value;
            }
        }

        public int FoodSafetyCheckList
        {
            get
            {
                return this.m_FoodSafetyCheckList; 
            }
            set
            {
                this.m_FoodSafetyCheckList = value;
            }
        }
        public int FoodSafetyCheckListAlert
        {
            get
            {
                return this.m_FoodSafetyCheckListAlert;
            }
            set
            {
                this.m_FoodSafetyCheckListAlert = value;
            }
        }
        public int Validation
        {
            get
            {
                return this.m_Validation;
            }
            set
            {
                this.m_Validation = value;
            }
        }
        public int ValidationAlert
        {
            get
            {
                return this.m_ValidationAlert;
            }
            set
            {
                this.m_ValidationAlert = value;
            }
        }

        public int FreezerLog
        {
            get
            {
                return this.m_FreezerLog;
            }
            set
            {
                this.m_FreezerLog = value;
            }
        }
        public int FreezerLogAlert
        {
            get
            {
                return this.m_FreezerLogAlert;
            }
            set
            {
                this.m_FreezerLogAlert = value;
            }
        }
        public float FreezerLogMax
        {
            get
            {
                return this.m_FreezerLogMax;
            }
            set
            {
                this.m_FreezerLogMax = value;
            }
        }
        public float FreezerLogMin
        {
            get
            {
                return this.m_FreezerLogMin;
            }
            set
            {
                this.m_FreezerLogMin = value;
            }
        }

        public int FreezerNewLog
        {
            get
            {
                return this.m_FreezerNewLog;
            }
            set
            {
                this.m_FreezerNewLog = value;
            }
        }
        public int FreezerNewLogAlert
        {
            get
            {
                return this.m_FreezerNewLogAlert;
            }
            set
            {
                this.m_FreezerNewLogAlert = value;
            }
        }
        public float FreezerNewLogMax
        {
            get
            {
                return this.m_FreezerNewLogMax;
            }
            set
            {
                this.m_FreezerNewLogMax = value;
            }
        }
        public float FreezerNewLogMin
        {
            get
            {
                return this.m_FreezerNewLogMin;
            }
            set
            {
                this.m_FreezerNewLogMin = value;
            }
        }

        public int HotHoldingLog
        {
            get
            {
                return this.m_HotHoldingLog;
            }
            set
            {
                this.m_HotHoldingLog = value;
            }
        }
        public float HotHoldingLogMin
        {
            get
            {
                return this.m_HotHoldingLogMin;
            }
            set
            {
                this.m_HotHoldingLogMin = value;
            }
        }
        public int HotHoldingLogAlert
        {
            get
            {
                return this.m_HotHoldingLogAlert;
            }
            set
            {
                this.m_HotHoldingLogAlert = value;
            }
        }
        public float HotHoldingLogMax
        {
            get
            {
                return this.m_HotHoldingLogMax;
            }
            set
            {
                this.m_HotHoldingLogMax = value;
            }
        }

        public int ReceivingLog
        {
            get
            {
                return this.m_ReceivingLog;
            }
            set
            {
                this.m_ReceivingLog = value;
            }
        }
        public int ReceivingLogAlert
        {
            get
            {
                return this.m_ReceivingLogAlert;
            }
            set
            {
                this.m_ReceivingLogAlert = value;
            }
        }
        public float ReceivingLogMax
        {
            get
            {
                return this.m_ReceivingLogMax;
            }
            set
            {
                this.m_ReceivingLogMax = value;
            }
        }
        public float ReceivingLogMin
        {
            get
            {
                return this.m_ReceivingLogMin;
            }
            set
            {
                this.m_ReceivingLogMin = value;
            }
        }

        public int RefrigerationLog
        {
            get
            {
                return this.m_RefrigerationLog;
            }
            set
            {
                this.m_RefrigerationLog = value;
            }
        }
        public int RefrigerationLogAlert
        {
            get
            {
                return this.m_RefrigerationLogAlert;
            }
            set
            {
                this.m_RefrigerationLogAlert = value;
            }
        }
        public float RefrigerationLogMax
        {
            get
            {
                return this.m_RefrigerationLogMax;
            }
            set
            {
                this.m_RefrigerationLogMax = value;
            }
        }
        public float RefrigerationLogMin
        {
            get
            {
                return this.m_RefrigerationLogMin;
            }
            set
            {
                this.m_RefrigerationLogMin = value;
            }
        }
        public int ShippingLog
        {
            get
            {
                return this.m_ShippingLog;
            }
            set
            {
                this.m_ShippingLog = value;
            }
        }
        public int ShippingLogAlert
        {
            get
            {
                return this.m_ShippingLogAlert;
            }
            set
            {
                this.m_ShippingLogAlert = value;
            }
        }
        public float ShippingLogMax
        {
            get
            {
                return this.m_ShippingLogMax;
            }
            set
            {
                this.m_ShippingLogMax = value;
            }
        }
        public float ShippingLogMin
        {
            get
            {
                return this.m_ShippingLogMin;
            }
            set
            {
                this.m_ShippingLogMin = value;
            }
        }

        public int PhLog
        {
            get
            {
                return this.m_PhLog;
            }
            set
            {
                this.m_PhLog = value;
            }
        }
        public int PhLogAlert
        {
            get
            {
                return this.m_PhLogAlert;
            }
            set
            {
                this.m_PhLogAlert = value;
            }
        }
        public float PhLogMax
        {
            get
            {
                return this.m_PhLogMax;
            }
            set
            {
                this.m_PhLogMax = value;
            }
        }
        public float PhLogMin
        {
            get
            {
                return this.m_PhLogMin;
            }
            set
            {
                this.m_PhLogMin = value;
            }
        }
        public int PestLog
        {
            get
            {
                return this.m_PestLog;
            }
            set
            {
                this.m_PestLog = value;
            }
        }
        public int PestLogAlert
        {
            get
            {
                return this.m_PestLogAlert;
            }
            set
            {
                this.m_PestLogAlert = value;
            }
        }
        public float PestLogMax
        {
            get
            {
                return this.m_PestLogMax;
            }
            set
            {
                this.m_PestLogMax = value;
            }
        }
        public float PestLogMin
        {
            get
            {
                return this.m_PestLogMin;
            }
            set
            {
                this.m_PestLogMin = value;
            }
        }
        public int MaintenanceLog
        {
            get
            {
                return this.m_MaintenanceLog;
            }
            set
            {
                this.m_MaintenanceLog = value;
            }
        }
        public int MaintenanceLogAlert
        {
            get
            {
                return this.m_MaintenanceLogAlert;
            }
            set
            {
                this.m_MaintenanceLogAlert = value;
            }
        }
        public float MaintenanceLogMax
        {
            get
            {
                return this.m_MaintenanceLogMax;
            }
            set
            {
                this.m_MaintenanceLogMax = value;
            }
        }
        public float MaintenanceLogMin
        {
            get
            {
                return this.m_MaintenanceLogMin;
            }
            set
            {
                this.m_MaintenanceLogMin = value;
            }
        }
        public int TemperatureLog
        {
            get
            {
                return this.m_TemnperatureLog;
;
            }
            set
            {
                this.m_TemnperatureLog = value;
            }
        }
        public int TemperatureLogAlert
        {
            get
            {
                return this.m_TemnperatureLogAlert;
                ;
            }
            set
            {
                this.m_TemnperatureLogAlert = value;
            }
        }
        public float TemperatureLogMax
        {
            get
            {
                return this.m_TemnperatureLogMax;
                ;
            }
            set
            {
                this.m_TemnperatureLogMax = value;
            }
        }
        public float TemperatureLogMin
        {
            get
            {
                return this.m_TemnperatureLogMin;
                ;
            }
            set
            {
                this.m_TemnperatureLogMin = value;
            }
        }
        public int Thermometer
        {
            get
            {
                return this.m_Thermometer;
            }
            set
            {
                this.m_Thermometer = value;
            }
        }
        public float ThermometerMin
        {
            get
            {
                return this.m_ThermometerMin;
            }
            set
            {
                this.m_ThermometerMin = value;
            }
        }
        public int ThermometerAlert
        {
            get
            {
                return this.m_ThermometerAlert;
            }
            set
            {
                this.m_ThermometerAlert = value;
            }
        }
        public float ThermometerMax
        {
            get
            {
                return this.m_ThermometerMax;
            }
            set
            {
                this.m_ThermometerMax = value;
            }
        }
        public int MenuItems
        {
            get
            {
                return this.m_MenuItems;
            }
            set
            {
                this.m_MenuItems = value;
            }
        }
        public int Ingredients
        {
            get
            {
                return this.m_Ingredients;
            }
            set
            {
                this.m_Ingredients = value;
            }
        }
        public int Vendors
        {
            get
            {
                return this.m_Vendors;
            }
            set
            {
                this.m_Vendors = value;
            }
        }
        public int Reports
        {
            get
            {
                return this.m_Reports;
            }
            set
            {
                this.m_Reports = value;
            }
        }
        public int Kitchentype
        {
            get
            {
                return m_KitchenType;
            }
            set
            {
                m_KitchenType = value;
            }
        }
        public int Active
        {
            get
            {
                return this.m_Active;
            }
            set
            {
                this.m_Active = value;
            }
        }
    }
}

//using System;
//using System.Collections.Generic;
//using System.Text;

//namespace SchoolHaccp.Common
//{
//   public class Kitchen
//    {
//        private int m_KitchenId;
//        private int m_DistrictId;
//        private string m_AccountNumber;
//        private string m_Name;

//        public int KitchenId
//        {
//            get { return m_KitchenId; }
//            set { m_KitchenId = value; }
//        }
//        public int DistrictId
//        {
//            get { return m_DistrictId; }
//            set { m_DistrictId = value; }
//        }
//        public string AccountNumber
//        {
//            get { return m_AccountNumber; }
//            set { m_AccountNumber = value; }
//        }
//        public string Name
//        {
//            get { return m_Name; }
//            set { m_Name  = value; }
//        }
//    }
//}
