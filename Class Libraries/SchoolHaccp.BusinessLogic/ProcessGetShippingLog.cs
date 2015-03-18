using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetShippingLog : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private ShippingLog m_ShippingLog;

        public ProcessGetShippingLog()
        {
        }

        public void Invoke()
        {
            GetShippingLog getShippingLog = new GetShippingLog();
            getShippingLog.ShippingLog = this.ShippingLog;
            this.ResultSet = getShippingLog.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetShippingLogByKitchenId(int nKitchenId)
        {
            GetShippingLog getLog = new GetShippingLog();
            return getLog.GetShippingLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetShippingLogByMobileId(int nKitchenId, int nMobileId)
        {
            GetShippingLog getLog = new GetShippingLog();
            return getLog.GetShippingLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        public IDataReader GetShippingLogByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetShippingLog getLog = new GetShippingLog();
            return getLog.GetShippingLogByDate(dtEntryDate, nKitchenId);
        }


        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }
}

