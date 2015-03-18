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
	public class ProcessGetValidationQuestions : IBusinessLogic
	{
		
        private DataSet m_DataSet;

        public ProcessGetValidationQuestions()
		{
		}
        public void Invoke()
        {
        }

        //public void Invoke()
        //{
        //    GetValidationQuestions getQuestions = new GetValidationQuestions();
        //    this.ResultSet = getQuestions.Get();
        //}

        public void Invoke(int tnPageIndex)
        {
            GetValidationQuestions getQuestions = new GetValidationQuestions("uspAdm_GetAllPagedQuestions");
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
            GetValidationQuestions getQuestions = new GetValidationQuestions();
            return getQuestions.Get(nKitchenId);
        }

        // RGK - Add Methods for District Level
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetValidationQuestionByGroupId(int nCheckListGroupId)
        {
            GetValidationQuestions getQuestions = new GetValidationQuestions();
            this.ResultSet = getQuestions.GetValidationQuestionByGroupId(nCheckListGroupId);            
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedQuestionsByGroupId(int nCheckListGroupId)
        {
            GetValidationQuestions getQuestions = new GetValidationQuestions();
            this.ResultSet = getQuestions.GetSelectedQuestionByGroupId(nCheckListGroupId);
            return this.ResultSet;
        }

        public IDataReader GetValidationQuestionById(int nValidationQuestionId)
        {
            GetValidationQuestions ValidationQuestion = new GetValidationQuestions();
            return ValidationQuestion.GetValidationQuestionById(nValidationQuestionId);
            
        }
        public DataSet GetQuestion(string strQuestion, int nValidationQuestionGroupId)
        {
            GetValidationQuestions ValidationQuestion = new GetValidationQuestions();
            this.ResultSet = ValidationQuestion.GetQuestion(strQuestion, nValidationQuestionGroupId);
            return this.ResultSet;

        }
        public DataSet GetQuestionByQuestionAndId(string strQuestion, int nQuestionId, int nValidationQuestionGroupId)
        {
            GetValidationQuestions ValidationQuestion = new GetValidationQuestions();
            this.ResultSet = ValidationQuestion.GetQuestionByQuestionAndId(strQuestion, nQuestionId, nValidationQuestionGroupId);
            return this.ResultSet;

        }
	}
}
