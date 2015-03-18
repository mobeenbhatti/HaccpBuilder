using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateFoodSafetyQuestion : IBusinessLogic
    {
        private FoodSafetyQuestion m_FoodSafetyQuestion;

        public ProcessCreateFoodSafetyQuestion()
        {
        }

        public void Invoke()
        {
            CreateFoodSafetyQuestion createFoodSafetyQuestion = new CreateFoodSafetyQuestion();
            createFoodSafetyQuestion.FoodSafetyQuestion = this.m_FoodSafetyQuestion;
            createFoodSafetyQuestion.Insert();
            this.m_FoodSafetyQuestion = createFoodSafetyQuestion.FoodSafetyQuestion;
        }       

        public FoodSafetyQuestion FoodSafetyQuestion
        {
            get { return m_FoodSafetyQuestion; }
            set { m_FoodSafetyQuestion = value; }
        }
    }
}
