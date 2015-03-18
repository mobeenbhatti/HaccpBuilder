using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class FoodSafetyQuestion
    {
        private int m_QuestionId;
        private string m_Question;
        private string m_Section;
        private int m_Active;
        private int m_SortOrder;
        private int m_CheckListGroupId;
        private int m_Additional;
        private int m_Custom;
        private int m_SectionId;
       // private int m_ChildQuestionId;

        public int Active
        {
            get
            {
                return this.m_Active;
            }
            set
            {
                this.m_Active = value;
            }
        }
        public int SectionId
        {
            get { return this.m_SectionId; }
            set { this.m_SectionId = value; }
        }

        public int Additional
        {
            get
            {
                return this.m_Additional;
            }
            set
            {
                this.m_Additional = value;
            }
        }

        public int CheckListGroupId
        {
            get
            {
                return this.m_CheckListGroupId;
            }
            set
            {
                this.m_CheckListGroupId = value;
            }
        }

        /*public int ChildQuestionId
        {
            get
            {
                return this.m_ChildQuestionId;
            }
            set
            {
                this.m_ChildQuestionId = value;
            }
        }*/

        public int Custom
        {
            get
            {
                return this.m_Custom;
            }
            set
            {
                this.m_Custom = value;
            }
        }

        public string Question
        {
            get
            {
                return this.m_Question;
            }
            set
            {
                this.m_Question = value;
            }
        }

        public int QuestionId
        {
            get
            {
                return this.m_QuestionId;
            }
            set
            {
                this.m_QuestionId = value;
            }
        }

        public string Section
        {
            get
            {
                return this.m_Section;
            }
            set
            {
                this.m_Section = value;
            }
        }

        public int SortOrder
        {
            get
            {
                return this.m_SortOrder;
            }
            set
            {
                this.m_SortOrder = value;
            }
        }


    }
       
}
