using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class FoodCategoryAction
    {
        private int m_CorrectiveActionID;
        private string m_Name;
        private int m_FoodCategoryID;
        private int m_Status;        
        private int m_IsInclude;
        private DateTime m_EntryDate;
        private DateTime m_ModifiedDate;

        public int CorrectiveActionID
        {
            get { return m_CorrectiveActionID; }
            set { m_CorrectiveActionID = value; }
        }
        public string Name
        {
            get { return m_Name; }
            set { m_Name = value; }
        }
        public int Status
        {
            get { return m_Status; }
            set { m_Status = value; }
        }

        public int FoodCategoryId
        {
            get { return m_FoodCategoryID; }
            set { m_FoodCategoryID = value; }
        }       
        public int IsInclude
        {
            get { return m_IsInclude; }
            set { m_IsInclude = value; }
        }
        public DateTime EntryDate
        {
            get { return m_EntryDate; }
            set { m_EntryDate = value; }
        }
        public DateTime ModifiedDate
        {
            get { return m_ModifiedDate; }
            set { m_ModifiedDate = value; }
        }
    }
}
