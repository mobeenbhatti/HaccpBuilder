using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;


namespace SchoolHaccp.BusinessLogic
{
    
    [System.ComponentModel.DataObject]
    public class ProcessGetProceduralQuestion : IBusinessLogic
    {

        private DataSet m_DataSet;

        public ProcessGetProceduralQuestion()
        {
        }       

        public void Invoke()
        {
            GetProceduralQuestions getQuestions = new GetProceduralQuestions();
            this.ResultSet = getQuestions.GetProceduralQuestionInfo();
        }

        public void Invoke(int tnPageIndex)
        {
            GetProceduralQuestions getQuestions = new GetProceduralQuestions("uspAdm_GetAllPagedQuestions");
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
        public DataSet GetQuestionsDataSet()
        {

            this.Invoke();
            return this.ResultSet;
        }
        public IDataReader GetQuestions(int nKitchenId)
        {
            GetProceduralQuestions getQuestions = new GetProceduralQuestions();
            return getQuestions.Get(nKitchenId);
        }

        // RGK - Add Methods for District Level
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetProceduralQuestionByGroupId(int nCheckListGroupId)
        {
            GetProceduralQuestions getQuestions = new GetProceduralQuestions();
            this.ResultSet = getQuestions.GetProceduralQuestionByGroupId(nCheckListGroupId);
            return this.ResultSet;

        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetSelectedQuestionsByGroupId(int nCheckListGroupId)
        {
            GetProceduralQuestions getQuestions = new GetProceduralQuestions();
            this.ResultSet = getQuestions.GetSelectedQuestionByGroupId(nCheckListGroupId);
            return this.ResultSet;
        }

        public IDataReader GetProceduralQuestionById(int nProceduralQuestionId)
        {
            GetProceduralQuestions ProceduralQuestion = new GetProceduralQuestions();
            return ProceduralQuestion.GetProceduralQuestionById(nProceduralQuestionId);

        }

    }
}
