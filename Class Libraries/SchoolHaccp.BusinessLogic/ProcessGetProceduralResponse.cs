using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;


namespace SchoolHaccp.BusinessLogic
{    
    [System.ComponentModel.DataObject]
    public class ProcessGetProceduralResponse : IBusinessLogic
    {

        private DataSet m_DataSet;

        public ProcessGetProceduralResponse()
        {
        }

        public void Invoke()
        {
            GetProceduralResponse savedAnswers = new GetProceduralResponse();
            //   this.ResultSet = savedAnswers.Get();
        }

        public void Invoke(int nKitchenId, int nQuestionId)
        {
            GetProceduralResponse savedAnswers = new GetProceduralResponse();
            this.ResultSet = savedAnswers.Get(nKitchenId, nQuestionId);
        }


        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetResponsesDataSet(int nKitchenId, int nQuestionId)
        {
            this.Invoke(nKitchenId, nQuestionId);
            return this.ResultSet;
        }

       
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetResponsesInfo(int nKitchenId)
        {
            GetProceduralResponse getResponses = new GetProceduralResponse();
            this.ResultSet = getResponses.GetResponsesInfo(nKitchenId);
            return this.ResultSet;
        }

    }
}
