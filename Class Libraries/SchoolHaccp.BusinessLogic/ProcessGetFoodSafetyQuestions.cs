using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;

//RGK - 01/21/2008
// Create a new class for Safety Checklist
namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
	public class ProcessGetFoodSafetyQuestions : IBusinessLogic
	{
		
        private DataSet m_DataSet;

        public ProcessGetFoodSafetyQuestions()
		{
		}
        public void Invoke()
        {
        }

        //public void Invoke()
        //{
        //    GetFoodSafetyQuestions getQuestions = new GetFoodSafetyQuestions();
        //    this.ResultSet = getQuestions.Get();
        //}

        public void Invoke(int tnPageIndex)
        {
            GetFoodSafetyQuestions getQuestions = new GetFoodSafetyQuestions("uspAdm_GetAllPagedQuestions");
            this.ResultSet = getQuestions.GetPagedDataSet(tnPageIndex);
        }

		public DataSet ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}
        //[System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        //public DataSet GetQuestionsDataSet()
        //{
        //    this.Invoke();
        //    return this.ResultSet;
        //}

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetQuestionsDataSet(int tnPageIndex)
        {
                       
            this.Invoke(tnPageIndex);
            return this.ResultSet;
        }
        public IDataReader GetQuestions(int nKitchenId)
        {
            GetFoodSafetyQuestions getQuestions = new GetFoodSafetyQuestions();
            return getQuestions.Get(nKitchenId);
        }

        // RGK - Add Methods for District Level
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFoodSafetyQuestionByGroupId(int nCheckListGroupId, int nPageIndex)
        {
            GetFoodSafetyQuestions getQuestions = new GetFoodSafetyQuestions();
            this.ResultSet = getQuestions.GetFoodSafetyQuestionByGroupId(nCheckListGroupId,nPageIndex);            
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedQuestionsByGroupId(int nCheckListGroupId)
        {
            GetFoodSafetyQuestions getQuestions = new GetFoodSafetyQuestions();
            this.ResultSet = getQuestions.GetSelectedQuestionByGroupId(nCheckListGroupId);
            return this.ResultSet;
        }

        public IDataReader GetFoodSafetyQuestionById(int nFoodSafetyQuestionId)
        {
            GetFoodSafetyQuestions FoodSafetyQuestion = new GetFoodSafetyQuestions();
            return FoodSafetyQuestion.GetFoodSafetyQuestionById(nFoodSafetyQuestionId);
            
        }
        public DataSet GetFoodSafetyQuestion(string strQuestion, int nCheckListGroupId)
        {
            GetFoodSafetyQuestions FoodSafetyQuestion = new GetFoodSafetyQuestions();
            this.ResultSet = FoodSafetyQuestion.GetFoodSafetyQuestion(strQuestion, nCheckListGroupId);
            return this.ResultSet;

        }
        public DataSet GetFoodSafetyQuestionByQuestionAndId(string strQuestion, int nQuestionId, int nCheckListGroupId)
        {
            GetFoodSafetyQuestions FoodSafetyQuestion = new GetFoodSafetyQuestions();
            this.ResultSet = FoodSafetyQuestion.GetFoodSafetyQuestionByQuestionAndId(strQuestion, nQuestionId, nCheckListGroupId);
            return this.ResultSet;

        }

	}
}