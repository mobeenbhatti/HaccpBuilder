using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
  public  class ProcessGetPhLog
    {
        private IDataReader m_ResultSet;
        private PhLog m_PhLog;

        public ProcessGetPhLog()
        {
        }

        public void Invoke()
        {
            GetPhLog getPhLog = new GetPhLog();
            getPhLog.PhLog = this.PhLog;
            this.ResultSet = getPhLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetPhLogByKitchenId(int nKitchenId)
        {
           
            GetPhLog getLog = new GetPhLog();
            return getLog.GetPhLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetPhLogByMobileId(int nKitchenId,int nMobileId)
        {

            GetPhLog getLog = new GetPhLog();
            return getLog.GetPhLogDataSetByMobileId(nKitchenId,nMobileId);
        }       
        public IDataReader GetPhLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetPhLog getLog = new GetPhLog();
            return getLog.GetPhLogByDate(dtEntryDate, nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetPhLogKitchenInventory(int nKitchenId)
        {
            GetPhLog getPhLog = new GetPhLog();
            return getPhLog.GetPhLogKitchenInventory(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetPhLogSentizers(int nKitchenId)
        {
            GetPhLog getPhLog = new GetPhLog();
            return getPhLog.GetPhLogSentizers(nKitchenId);
        }
        public PhLog PhLog
        {
            get { return m_PhLog; }
            set { m_PhLog = value; }
        }
    }
}
