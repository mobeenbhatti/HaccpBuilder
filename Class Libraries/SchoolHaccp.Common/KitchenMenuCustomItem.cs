using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
 public   class KitchenMenuCustomItem
    {
        private int m_KitchenMenuCustomId;
        private string m_RecipeNumber;
        private string m_Name;
        private int m_FoodGroupId;
        private int m_PreparationTypeId;
        private int m_ProcessId;
        private int m_Ready;
        private string m_Instructions;
        private int m_Selected;
        private int m_KitchenId;

        public int KitchenMenuCustomId
        {
            get { return m_KitchenMenuCustomId; }
            set { m_KitchenMenuCustomId = value; }
        }
        public string RecipeNumber
        {
            get { return m_RecipeNumber; }
            set { m_RecipeNumber = value; }
        }
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }
        public int FoodGroupId
        {
            get { return m_FoodGroupId; }
            set { m_FoodGroupId = value; }
        }
        public int PreparationTypeId
        {
            get { return m_PreparationTypeId; }
            set { m_PreparationTypeId = value; }
        }
        public int ProcessId
        {
            get { return m_ProcessId; }
            set { m_ProcessId = value; }
        }
        public int Ready
        {
            get { return m_Ready; }
            set { m_Ready = value; }
        }
        public int Selected
        {
            get { return m_Selected; }
            set { m_Selected = value; }
        }
        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
        public string Instructions
        {
            get { return m_Instructions; }
            set { m_Instructions = value; }
        }


    }
}
