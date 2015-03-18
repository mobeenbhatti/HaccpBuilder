using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetCriticalLimits: IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private CriticalLimit m_CriticalLimits;

        public ProcessGetCriticalLimits()
        {
        }

        public void Invoke()
        {
            GetCriticalLimits getCriticalLimits = new GetCriticalLimits();
            //getCriticalLimits. = this.CriticalLimits;
            //this.ResultSet = getCriticalLimits.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCriticalLimitsByKitchenId(int nKitchenId, int nLogTypeId)
        {
            GetCriticalLimits getCriticalLimit = new GetCriticalLimits();
            return getCriticalLimit.GetCriticalLimitsDataSet(nKitchenId, nLogTypeId);
        }
        public IDataReader GetCriticalLimitsById(int nCriticalLimitId)
        {
            GetCriticalLimits getCriticalLimit = new GetCriticalLimits();
            return getCriticalLimit.GetCriticalLimitById(nCriticalLimitId);
        }
        public CriticalLimit CriticalLimits
        {
            get { return m_CriticalLimits; }
            set { m_CriticalLimits = value; }
        }
    }
}