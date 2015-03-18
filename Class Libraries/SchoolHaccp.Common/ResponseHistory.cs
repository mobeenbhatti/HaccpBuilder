using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class ResponseHistory
    {
        private int m_HistoryId;
        private int m_ResponseWeek;
        private string m_Observer;
        private int m_KitchenId;
        private int m_Year;
        private DateTime m_EntryDate;
        private int m_MobileId;

        public ResponseHistory()
        {

        }
        public int Year
        {
            get { return m_Year; }
            set { m_Year = value; }
        }
        public DateTime EntryDate
        {
            get { return m_EntryDate; }
            set { m_EntryDate = value; }
        }


        public int ResponseWeek
        {
            get { return m_ResponseWeek; }
            set { m_ResponseWeek = value; }
        }


        public string Observer
        {
            get { return m_Observer; }
            set { m_Observer = value; }
        }


        public int HistoryId
        {
            get { return m_HistoryId; }
            set { m_HistoryId = value; }
        }

        public int KitchenId
        {
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
        }

        public int MobileId
        {
            get { return m_MobileId; }
            set { m_MobileId = value; }
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

