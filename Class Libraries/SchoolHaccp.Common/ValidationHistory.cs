using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class ValidationHistory
    {
        private int m_ValidationHistoryId;
        private int m_ValidationWeek;
        private string m_ResponsiblePerson;
        private int m_KitchenId;
        private int m_ValidationYear;
        private int m_IsComplete;
        private DateTime m_EntryDate;
        private string m_ObserverTitle;
        private string m_ManagerTitle;
        private int m_Frequency;
        private string m_FrequencyMode;
        private DateTime m_ValidationLastdate;
        private int m_TimePeriod;
        private string m_TimePeriodMode;
        private DateTime m_ValidationDueDate;
        private string m_VerifiedBy;
        private string m_Reason;


        public ValidationHistory()
        {

        }
        public string ManagerTitle
        {
            get { return m_ManagerTitle; }
            set { m_ManagerTitle = value; }
        }
        public string FrequencyMode
        {
            get { return m_FrequencyMode; }
            set { m_FrequencyMode = value; }
        }
        public string TimePeriodMode
        {
            get { return m_TimePeriodMode; }
            set { m_TimePeriodMode = value; }
        }
        public int ValidationYear
        {
            get { return m_ValidationYear; }
            set { m_ValidationYear = value; }
        }
        public string Reason
        {
            get { return m_Reason; }
            set { m_Reason = value; }
        }

        public int ValidationWeek
        {
            get { return m_ValidationWeek; }
            set { m_ValidationWeek = value; }
        }


        public string ResponsiblePerson
        {
            get { return m_ResponsiblePerson; }
            set { m_ResponsiblePerson = value; }
        }


        public int ValidationHistoryId
        {
            get { return m_ValidationHistoryId; }
            set { m_ValidationHistoryId = value; }
        }

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }
       

        public int IsComplete
        {
            get{return m_IsComplete;}
            set{m_IsComplete = value;}
        }
        public DateTime EntryDate
        {
            get{return m_EntryDate;}
            set{m_EntryDate = value;}
        }
        public string Title
        {
            get{return  m_ObserverTitle;}
            set{m_ObserverTitle = value;}
        }
        public int Frequency
        {
            get{return m_Frequency;}
            set{ m_Frequency= value;}
        }
        public DateTime ValidationLastdate
        {
            get{return m_ValidationLastdate;}
            set{m_ValidationLastdate = value;}
        }
       public int TimePeriod
       {
           get{return m_TimePeriod;}
           set{ m_TimePeriod = value;}
       }
        public DateTime ValidationDueDate
        {
            get{ return m_ValidationDueDate;}
            set{m_ValidationDueDate = value;}
        }
        public string VerifiedBy
        {
            get{ return m_VerifiedBy;}
            set{m_VerifiedBy = value;}
        }
        /*
        public DateTime CreatedDate
        {
            get { return m_CreatedDate; }
            set { m_CreatedDate = value; }
        }

        public DateTime ModifiedDate
        {
            get { return m_ModifiedDate; }
            set { m_ModifiedDate = value; }
        }*/
    }
}
