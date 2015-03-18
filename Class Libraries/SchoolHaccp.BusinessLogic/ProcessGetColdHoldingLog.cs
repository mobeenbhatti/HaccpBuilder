using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetColdHoldingLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private ColdHoldingLog m_ColdHoldingLog;

        public ProcessGetColdHoldingLog()
        {
        }

        public void Invoke()
        {
            GetColdHoldingLog getColdHoldingLog = new GetColdHoldingLog();
            getColdHoldingLog.ColdHoldingLog = this.ColdHoldingLog;
            this.ResultSet = getColdHoldingLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetColdHoldingLogByKitchenId(int nKitchenId)
        {
            GetColdHoldingLog getLog = new GetColdHoldingLog();
            return getLog.GetColdHoldingLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetColdHoldingLogByMobileId(int nKitchenId,int nMobileId)
        {
            GetColdHoldingLog getLog = new GetColdHoldingLog();
            return getLog.GetColdHoldingLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetColdHoldingLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetColdHoldingLog getLog = new GetColdHoldingLog();
            return getLog.GetColdHoldingLogByDate(dtEntryDate,nKitchenId);
        }

       
        public ColdHoldingLog ColdHoldingLog
        {
            get { return m_ColdHoldingLog; }
            set { m_ColdHoldingLog = value; }
        }
    }
}
