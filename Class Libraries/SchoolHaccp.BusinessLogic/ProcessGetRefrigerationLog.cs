using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetRefrigerationLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private RefrigerationLog m_RefrigerationLog;

        public ProcessGetRefrigerationLog()
        {
        }

        public void Invoke()
        {
            GetRefrigerationLog getRefrigerationLog = new GetRefrigerationLog();
            getRefrigerationLog.RefrigerationLog = this.RefrigerationLog;
            this.ResultSet = getRefrigerationLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetRefrigerationLogByKitchenId(int nKitchenId)
        {
            GetRefrigerationLog getLog = new GetRefrigerationLog();
            return getLog.GetRefrigerationLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetRefrigerationLogByMobileId(int nKitchenId,int nMobileId)
        {
            GetRefrigerationLog getLog = new GetRefrigerationLog();
            return getLog.GetRefrigerationLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public DataSet GetRefrigerationCustomInventoriesByKitchenId(int nKitchenId)
        {
            GetRefrigerationLog getLog = new GetRefrigerationLog();
            return getLog.GetRefrigerationCustomInventoriesDataSet(nKitchenId);
        }
        public IDataReader GetRefrigerationLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetRefrigerationLog getLog = new GetRefrigerationLog();
            return getLog.GetRefrigerationLogByDate(dtEntryDate, nKitchenId);
        }


        public RefrigerationLog RefrigerationLog
        {
            get { return m_RefrigerationLog; }
            set { m_RefrigerationLog = value; }
        }
    }
}
