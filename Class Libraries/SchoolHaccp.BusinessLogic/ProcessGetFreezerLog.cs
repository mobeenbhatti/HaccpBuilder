using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetFreezerLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private FreezerLog m_FreezerLog;

        public ProcessGetFreezerLog()
        {
        }

        public void Invoke()
        {
            GetFreezerLog getFreezerLog = new GetFreezerLog();
            getFreezerLog.FreezerLog = this.FreezerLog;
            this.ResultSet = getFreezerLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFreezerLogByKitchenId(int nKitchenId)
        {
            GetFreezerLog getLog = new GetFreezerLog();
            return getLog.GetFreezerLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetFreezerLogByMobileId(int nKitchenId,int nMobileId)
        {
            GetFreezerLog getLog = new GetFreezerLog();
            return getLog.GetFreezerLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetFreezerLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetFreezerLog getLog = new GetFreezerLog();
            return getLog.GetFreezerLogByDate(dtEntryDate,nKitchenId);
        }

       
        public FreezerLog FreezerLog
        {
            get { return m_FreezerLog; }
            set { m_FreezerLog = value; }
        }
    }
}
