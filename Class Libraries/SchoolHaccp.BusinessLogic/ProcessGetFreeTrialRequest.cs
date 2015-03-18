using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetFreeTrialRequest : IBusinessLogic
    {
       private DataSet m_ResultSet;

        public ProcessGetFreeTrialRequest()
        {
        }

        public void Invoke()
        {

        }
        //public void Invoke(string strUserName)
        //{
        //    GetFreeTrialRequest FreeTrialRequest = new GetFreeTrialRequest();
        //    this.ResultSet = FreeTrialRequest.GetFreeTrialRequestByUser(strUserName);
        //}
        public DataSet ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        //public IDataReader Get(string strUserName)
        //{
        //    this.Invoke(strUserName);
        //    return this.ResultSet;
        //}
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFreeTrialRequestDetail()
        {
            GetFreeTrialRequest FreeTrialRequest = new GetFreeTrialRequest();
            this.ResultSet=FreeTrialRequest.GetFreeTrialRequestDetail();
            return this.ResultSet;
        }
        public DataSet GetFreeTrialRequestById(string strRequestId)
        {
            GetFreeTrialRequest FreeTrialRequest = new GetFreeTrialRequest();
            this.ResultSet = FreeTrialRequest.GetFreeTrialRequestById(strRequestId);
            return this.ResultSet;
        }
    }
}

