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
	public class ProcessGetValidationResponse : IBusinessLogic
	{
		
        private DataSet m_DataSet;

        public ProcessGetValidationResponse()
		{
		}

		public void Invoke()
		{
            GetValidationResponses savedAnswers = new GetValidationResponses();
         //   this.ResultSet = savedAnswers.Get();
		}

        public void Invoke(int nKitchenId,int nHistoryId)
        {
            GetValidationResponses savedAnswers = new GetValidationResponses();
            this.ResultSet = savedAnswers.Get(nKitchenId,nHistoryId);
        }
                

		public DataSet ResultSet
		{
            get { return m_DataSet; }
            set { m_DataSet = value; }
		}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetResponsesDataSet(int nKitchenId,int nHistoryId)
        {
            this.Invoke(nKitchenId,nHistoryId);
            return this.ResultSet;
        }

        //public bool IsPageSubmitted(int nKitchenId,int nHistoryId, int nPageIndex)
        //{
        //    this.Invoke(nKitchenId,nHistoryId, nPageIndex);
        //   // DataRow row = this.ResultSet.Tables[0].Rows[0];
        //    if (this.ResultSet.Tables[0].Rows.Count == 0)
        //        return false;
        //    else
        //        return true;
           
        //}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetResponsesByHistoryId(int nHistoryId)
        {
            GetValidationResponses getResponses = new GetValidationResponses();
           this.ResultSet = getResponses.GetResponsesByHistoryId(nHistoryId);
            return this.ResultSet;
        }
               
	}
}