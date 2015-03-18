using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenMenuItem
    {
        private int m_MenuItemId;
        private string m_ItemName;
       private string m_FileName;
       private int m_PreparationType;
       private int m_ProcessId;
       private int m_FoodGroupId;
        private int m_Selected;      
       // private string m_IsCustom;
        private int m_KitchenId;

        public KitchenMenuItem()
        {
            this.PreparationType = 3;
        }

        public int MenuItemId
        {
            get { return m_MenuItemId; }
            set { m_MenuItemId = value; }
        }
        public string ItemName
        {
            get { return m_ItemName; }
            set { m_ItemName = value; }
        }
       public string FileName
       {
           get{return m_FileName;}
           set{m_FileName=value;}
       }
       public int PreparationType
       {
           get{return m_PreparationType;}
           set{m_PreparationType=value;}
       }
       public int ProcessId
       {
           get{return m_ProcessId;}
           set{m_ProcessId=value;}
       }
        public int Selected
        {
            get { return m_Selected; }
            set { m_Selected = value; }
        }
        
        //public string IsCustom
        //{
        //    get { return m_IsCustom; }
        //    set { m_IsCustom = value; }
        //}
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }

    }
}



