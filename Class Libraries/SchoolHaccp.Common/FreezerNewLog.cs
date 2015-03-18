using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class FreezerNewLog
    {
        private int m_FreezerNewLogId;
        private DateTime m_EntryDate;
        private DateTime m_MealDate;
        private DateTime m_TempTime;
        private string m_Location;
        private float m_Temperature;       
        private string m_CorrectiveAction;
        private string m_UserName;
        private string m_VerifiedBy;
        private DateTime m_VerifiedDate;
        private int m_IngredientId;
        private int m_MenuItemId;
        private int m_KitchenId;
        private int m_CorrectiveAction1;
        private int m_FreezerNewLogDevice;
        private int m_MobileId;

        public FreezerNewLog()
        {

            this.VerifiedBy = null;
            this.CorrectiveAction = null;
            this.Temperature = 99999;
        }
        public int FreezerNewLogDevice
        {
            get
            {
                return m_FreezerNewLogDevice;
            }
            set
            {
                m_FreezerNewLogDevice = value;
            }
        }

        public int FreezerNewLogId
        {
            get
            {
                return m_FreezerNewLogId;
            }
            set
            {
                m_FreezerNewLogId = value;
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

        public string Location
        {
            get
            {
                return m_Location;
            }
            set
            {
                m_Location = value;
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
