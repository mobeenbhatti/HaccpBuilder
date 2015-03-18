using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetFoodSafetyQuestion : IBusinessLogic
    {
        private FoodSafetyQuestion m_FoodSafetyQuestion;

        public ProcessSetFoodSafetyQuestion()
        {
        }

        public void Invoke()
        {
            SetFoodSafetyQuestion setFoodSafetyQuestion = new SetFoodSafetyQuestion();
            setFoodSafetyQuestion.FoodSafetyQuestion = this.m_FoodSafetyQuestion;
            setFoodSafetyQuestion.Update();
        }
        public void FoodSafetyQuestionSelection()
        {
            SetFoodSafetyQuestion setFoodSafetyQuestion = new SetFoodSafetyQuestion();
            setFoodSafetyQuestion.FoodSafetyQuestion = this.m_FoodSafetyQuestion;
            setFoodSafetyQuestion.UpdateSelection();
        }

        public FoodSafetyQuestion FoodSafetyQuestion
        {
            get { return m_FoodSafetyQuestion; }
            set { m_FoodSafetyQuestion = value; }
        }
    }
}
