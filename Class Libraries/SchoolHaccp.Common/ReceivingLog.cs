using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class ReceivingLog
    {
        private int m_ReceivingLogId;
        private DateTime m_EntryDate;
        private DateTime m_MealDate;
        private int m_VendorId;
        private int m_IngredientId;
        private float m_Temperature;
        private string m_CorrectiveAction;
        private string m_UserName;
        private string m_VerifiedBy;
        private DateTime m_VerifiedDate;
        private int m_KitchenId;
        private int m_FoodItem;
        private int m_MenuItemId;
        private string m_BatchNumber;
        private int m_CorrectiveAction1;
        private DateTime m_TempTime;
        private int m_TempRequired;
        private string m_Volume;
        private int m_MobileId;
        public ReceivingLog()
        {
            

            this.VerifiedBy = null;
            this.CorrectiveAction = null;
            this.Temperature = 99999;
        }
        public DateTime TempTime
        {
            get
            {
                return m_TempTime;
            }
            set
            {
                m_TempTime = value;
            }
        }
        public int TempRequired
        {
            get
            {
                return m_TempRequired;
            }
            set
            {
                m_TempRequired = value;
            }
        }
        public int ReceivingLogId
        {
            get
            {
                return m_ReceivingLogId;
            }
            set
            {
                m_ReceivingLogId = value;
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

        public int VendorId
        {
            get
            {
                return m_VendorId;
            }
            set
            {
                m_VendorId = value;

            }
        }

        public int IngredientId
        {
            get
            {
                return m_IngredientId;
            }
            set
            {
                m_IngredientId = value;
            }
        }
        public int MenuItemId
        {
            get 
            { 
                return m_MenuItemId; 
            }
            set 
            { 
                m_MenuItemId = value; 
            }
        }
        public int FoodItem
        {
            get
            {
                return m_FoodItem;
            }
            set
            {
                m_FoodItem = value;
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
        public string BatchNumber
        {
            get
            {
                return m_BatchNumber;
            }
            set
            {
                m_BatchNumber = value;
            }
        }
        public string Volume
        {
            get
            {
                return m_Volume;
            }
            set
            {
                m_Volume = value;
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
