using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
	public class FoodSafetyResponse
	{
		private int m_ResponseId;
		private int m_KitchenId;
		private int m_QuestionId;
		private int m_Answer;
		private string m_CorrectiveAction;
        private int m_HistoryId;


        public FoodSafetyResponse()
		{
			
		}


        public int ResponseId
		{
            get { return m_ResponseId; }
            set { m_ResponseId = value; }
		}


        public int KitchenId
		{
            get { return m_KitchenId; }
            set { m_KitchenId = value; }
		}

        public int QuestionId
        {
            get { return m_QuestionId; }
            set { m_QuestionId = value; }
        }

        public int Answer
        {
            get { return m_Answer; }
            set { m_Answer = value; }
        }

        public string CorrectiveAction
		{
            get { return m_CorrectiveAction; }
            set
            {
                m_CorrectiveAction = value;
            }
		}

        public int HistoryId
        {
            get { return m_HistoryId; }
            set { m_HistoryId = value; }
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
