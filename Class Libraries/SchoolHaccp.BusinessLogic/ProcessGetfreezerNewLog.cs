using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetFreezerNewLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private FreezerNewLog m_FreezerNewLog;

        public ProcessGetFreezerNewLog()
        {
        }

        public void Invoke()
        {
            GetFreezerNewLog getFreezerNewLog = new GetFreezerNewLog();
            getFreezerNewLog.FreezerNewLog = this.FreezerNewLog;
            this.ResultSet = getFreezerNewLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFreezerNewLogByKitchenId(int nKitchenId)
        {
           
            GetFreezerNewLog getLog = new GetFreezerNewLog();
            return getLog.GetFreezerNewLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFreezerNewLogByMobileId(int nKitchenId,int nMobileId)
        {

            GetFreezerNewLog getLog = new GetFreezerNewLog();
            return getLog.GetFreezerNewLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public DataSet GetFreezerNewLogCustomInventoriesByKitchenId(int nKitchenId)
        {
            GetFreezerNewLog getLog = new GetFreezerNewLog();
            return getLog.GetFreezerNewLogCustomInventoriesDataSet(nKitchenId);
        }
        public IDataReader GetFreezerNewLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetFreezerNewLog getLog = new GetFreezerNewLog();
            return getLog.GetFreezerNewLogByDate(dtEntryDate, nKitchenId);
        }


        public FreezerNewLog FreezerNewLog
        {
            get { return m_FreezerNewLog; }
            set { m_FreezerNewLog = value; }
        }
    }
}
