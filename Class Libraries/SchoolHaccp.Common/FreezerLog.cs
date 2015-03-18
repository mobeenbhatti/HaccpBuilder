using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{

    public class FreezerLog
    {
        private int m_FreezerLogId;
        private DateTime m_EntryDate;
        private DateTime m_MealDate;
        private int m_FoodItem;
        private int m_IsCustomItem;
        private float m_Temp1;
        private DateTime m_Temp1Time;
        private float m_Temp2;
        private DateTime m_Temp2Time;
        private float m_Temp3;
        private DateTime m_Temp3Time;
        private float m_Temp4;
        private DateTime m_Temp4Time;
        private float m_Temp5;
        private DateTime m_Temp5Time;
        private float m_Temp6;
        private DateTime m_Temp6Time;
        private string m_CorrectiveAction;
        private string m_UserName;
        private string m_VerifiedBy;
        private DateTime m_VerifiedDate;
        private int m_IngredientId;
        private int m_MenuItemId;
        private int m_KitchenId;
        private int m_CorrectiveAction1;
        private int m_CorrectiveAction2;
        private int m_CorrectiveAction3;
        private int m_MobileId;
        public FreezerLog()
        {

            this.VerifiedBy = null;
            this.CorrectiveAction = null;
            this.Temp1 = 99999;
            this.Temp2 = 99999;
            this.Temp3 = 99999;
        }


        public int FreezerLogId
        {
            get
            {
                return m_FreezerLogId;
            }
            set
            {
                m_FreezerLogId = value;
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
        public int CorrectiveAction3
        {
            get
            {
                return m_CorrectiveAction3;
            }
            set
            {
                m_CorrectiveAction3 = value;
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

        public float Temp1
        {
            get
            {
                return m_Temp1;
            }
            set
            {
                m_Temp1 = value;
            }
        }

        public DateTime Temp1Time
        {
            get
            {
                return m_Temp1Time;
            }
            set
            {
                m_Temp1Time = value;
            }
        }

        public float Temp2
        {
            get
            {
                return m_Temp2;
            }
            set
            {
                m_Temp2 = value;
            }
        }
        public float Temp3
        {
            get
            {
                return m_Temp3;
            }
            set
            {
                m_Temp3 = value;
            }
        }
        public float Temp4
        {
            get
            {
                return m_Temp4;
            }
            set
            {
                m_Temp4 = value;
            }
        }
        public float Temp5
        {
            get
            {
                return m_Temp5;
            }
            set
            {
                m_Temp5 = value;
            }
        }
        public float Temp6
        {
            get
            {
                return m_Temp6;
            }
            set
            {
                m_Temp6 = value;
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
        public DateTime Temp3Time
        {
            get
            {
                return m_Temp3Time;
            }
            set
            {
                m_Temp3Time = value;
            }
        }
        public DateTime Temp4Time
        {
            get
            {
                return m_Temp4Time;
            }
            set
            {
                m_Temp4Time = value;
            }
        }
        public DateTime Temp5Time
        {
            get
            {
                return m_Temp5Time;
            }
            set
            {
                m_Temp5Time = value;
            }

        }
        public DateTime Temp6Time
        {
            get
            {
                return m_Temp6Time;
            }
            set
            {
                m_Temp6Time = value;
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
