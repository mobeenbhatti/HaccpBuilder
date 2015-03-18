using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteFoodSafetQuestion : IBusinessLogic
    {
        private FoodSafetyQuestion m_FoodSafetyQuestion;

        public ProcessDeleteFoodSafetQuestion()
        {
        }

        public void Invoke()
        {
            DeleteFoodSafetyQuestion deleteFoodSafetyQuestion = new DeleteFoodSafetyQuestion();
            deleteFoodSafetyQuestion.FoodSafetyQuestion = this.m_FoodSafetyQuestion;
            deleteFoodSafetyQuestion.Delete();
        }

        public FoodSafetyQuestion FoodSafetyQuestion
        {
            get { return m_FoodSafetyQuestion; }
            set { m_FoodSafetyQuestion = value; }
        }
    }
}

