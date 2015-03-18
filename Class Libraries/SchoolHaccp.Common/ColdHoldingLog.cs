using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class ColdHoldingLog
    {
        private int m_ColdHoldingLogId;
        private DateTime m_EntryDate;
        private DateTime m_MealDate;
        private int m_FoodItem;
        private int m_IsCustomItem;
        private float m_Internaltemp1;
        private DateTime m_Temp1Time;
        private float m_InternalTemp2;
        private DateTime m_Temp2Time;
        private string m_CorrectiveAction;
        private string m_UserName;
        private string m_VerifiedBy;
        private DateTime m_VerifiedDate;
        private int m_KitchenId;
        private int m_IngredientId;
        private int m_MenuItemId;
        private int m_CorrectiveAction1;
        private int m_CorrectiveAction2;
        private int m_MobileId;
        public ColdHoldingLog()
        {
            
            this.VerifiedBy = null;
            this.CorrectiveAction = null;
            this.InternalTemp1 = 99999;
            this.InternalTemp2 = 99999;

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


        public int ColdHoldingLogId
        {
            get
            {
                return m_ColdHoldingLogId;
            }
            set
            {
                m_ColdHoldingLogId=value;
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

        public int IsCustomItem
        {
            get
            {
                return m_IsCustomItem;
            }
            set
            {
                m_IsCustomItem = value;
            }
        }

        public float InternalTemp1
        {
            get
            {
                return m_Internaltemp1;
            }
            set
            {
                m_Internaltemp1 = value;
            }
        }

        public DateTime Temp1Time
        {
            get
            {
              return  m_Temp1Time;
            }
            set
            {
                m_Temp1Time = value;
            }
        }

        public float InternalTemp2
        {
            get
            {
                return m_InternalTemp2;
            }
            set
            {
                m_InternalTemp2 = value;
            }
        }

        public DateTime Temp2Time
        {
            get
            {
                return m_Temp2Time;
            }
            set
            {
                m_Temp2Time = value;
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
