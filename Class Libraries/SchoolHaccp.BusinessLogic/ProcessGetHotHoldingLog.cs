using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetHotHoldingLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private HotHoldingLog m_HotHoldingLog;

        public ProcessGetHotHoldingLog()
        {
        }

        public void Invoke()
        {
            GetHotHoldingLog getHotHoldingLog = new GetHotHoldingLog();
            getHotHoldingLog.HotHoldingLog = this.HotHoldingLog;
            this.ResultSet = getHotHoldingLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetHotHoldingLogByKitchenId(int nKitchenId)
        {
            GetHotHoldingLog getLog = new GetHotHoldingLog();
            return getLog.GetHotHoldingLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetHotHoldingLogByMobileId(int nKitchenId,int nMobileId)
        {
            GetHotHoldingLog getLog = new GetHotHoldingLog();
            return getLog.GetHotHoldingLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetHotHoldingLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetHotHoldingLog getLog = new GetHotHoldingLog();
            return getLog.GetHotHoldingLogByDate(dtEntryDate, nKitchenId);
        }

       
        public HotHoldingLog HotHoldingLog
        {
            get { return m_HotHoldingLog; }
            set { m_HotHoldingLog = value; }
        }
    }
}
