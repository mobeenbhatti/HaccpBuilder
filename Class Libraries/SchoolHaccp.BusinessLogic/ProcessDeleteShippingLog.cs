using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteShippingLog : IBusinessLogic
    {
        private ShippingLog m_ShippingLog;

        public ProcessDeleteShippingLog()
        {
        }

        public void Invoke()
        {
            DeleteShippingLog deleteShippingLog = new DeleteShippingLog();
            deleteShippingLog.ShippingLog = this.m_ShippingLog;
            deleteShippingLog.Delete();
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }
}


