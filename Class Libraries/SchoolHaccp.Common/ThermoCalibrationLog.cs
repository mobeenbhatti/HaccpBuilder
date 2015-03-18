using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{

    public class ThermoCalibrationLog
    {
        private int m_ThermoCalibrationLogId;
        private DateTime m_EntryDate;
        private DateTime m_MealDate;
        private string m_Thermometer;       
        private float m_Temperature=99999;       
        private string m_CorrectiveAction;
        private string m_UserName;
        private string m_VerifiedBy;
        private DateTime m_VerifiedDate;
        private int m_IngredientId;
        private int m_MenuItemId;
        private int m_KitchenId;
        private int m_Week;
        private int m_CorrectiveAction1;
        private int m_CorrectiveAction2;
        private float m_Temperature2 = 99999;
        private float m_Temperature3 = 99999;
        private int m_ThermometerID;
        private int m_MobileId;

        public ThermoCalibrationLog()
        {

            this.VerifiedBy = null;
            this.CorrectiveAction = null;
            this.Temperature = 99999;
        }


        public int ThermoCalibrationLogId
        {
            get
            {
                return m_ThermoCalibrationLogId;
            }
            set
            {
                m_ThermoCalibrationLogId = value;
            }
        }
        public int IngredientId
        {
            get { return m_IngredientId; }
            set { m_IngredientId = value; }
        }
        public int MenuItemId
        {
            get { return m_MenuItemId; }
            set { m_MenuItemId = value; }
        }

        public DateTime EntryDate
        {
            get
            {
                return m_EntryDate;
            }
            set
            {
                m_EntryDate = value;
            }
        }

        public string Thermometer
        {
            get
            {
                return m_Thermometer;
            }
            set
            {
                m_Thermometer = value;
            }
        }
       

        public float Temperature
        {
            get
            {
                return m_Temperature;
            }
            set
            {
                m_Temperature = value;
            }
        }
        public float Temperature2
        {
            get
            {
                return m_Temperature2;
            }
            set
            {
                m_Temperature2 = value;
            }
        }
        public float Temperature3
        {
            get
            {
                return m_Temperature3;
            }
            set
            {
                m_Temperature3 = value;
            }
        }
       
       

        public string CorrectiveAction
        {
            get
            {
                return m_CorrectiveAction;
            }
            set
            {
                m_CorrectiveAction = value;
            }
        }
        public int CorrectiveAction1
        {
            get
            {
                return m_CorrectiveAction1;
            }
            set
            {
                m_CorrectiveAction1 = value;
            }
        }
        public int CorrectiveAction2
        {
            get
            {
                return m_CorrectiveAction2;
            }
            set
            {
                m_CorrectiveAction2 = value;
            }
        }

        public string UserName
        {
            get
            {
                return m_UserName;
            }
            set
            {
                m_UserName = value;
            }
        }

        public string VerifiedBy
        {
            get
            {
                return m_VerifiedBy;
            }
            set
            {
                m_VerifiedBy = value;
            }
        }

        public DateTime VerifiedDate
        {
            get
            {
                return m_VerifiedDate;
            }
            set
            {
                m_VerifiedDate = value;
            }
        }
        public DateTime MealDate
        {
            get
            {
                return m_MealDate;
            }
            set
            {
                m_MealDate = value;
            }
        }

        public int KitchenId
        {
            get
            {
                return m_KitchenId;
            }
            set
            {
                m_KitchenId = value;
            }
        }
        public int Week
        {
            get { return m_Week; }
            set { m_Week = value; }
        }
        public int ThermometerID
        {
            get
            {
                return m_ThermometerID;
            }
            set
            {
                m_ThermometerID = value;
            }
        }
        public int MobileId
        {
            get
            {
                return m_MobileId;
            }
            set
            {
                m_MobileId = value;
            }
        }
    }
}