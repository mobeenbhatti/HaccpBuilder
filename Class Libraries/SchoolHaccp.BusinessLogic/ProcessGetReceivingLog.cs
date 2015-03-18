using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetReceivingLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private ReceivingLog m_ReceivingLog;

        public ProcessGetReceivingLog()
        {
        }

        public void Invoke()
        {
            GetReceivingLog getReceivingLog = new GetReceivingLog();
            getReceivingLog.ReceivingLog = this.ReceivingLog;
            this.ResultSet = getReceivingLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetReceivingLogByKitchenId(int nKitchenId)
        {
            GetReceivingLog getLog = new GetReceivingLog();
            return getLog.GetReceivingLogDataSet(nKitchenId);
        }

        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetReceivingLogByMobileId(int nKitchenId, int nMobileId)
        {
            GetReceivingLog getLog = new GetReceivingLog();
            return getLog.GetReceivingLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetReceivingLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetReceivingLog getLog = new GetReceivingLog();
            return getLog.GetReceivingLogByDate(dtEntryDate, nKitchenId);
        }


        public ReceivingLog ReceivingLog
        {
            get { return m_ReceivingLog; }
            set { m_ReceivingLog = value; }
        }
    }
}
