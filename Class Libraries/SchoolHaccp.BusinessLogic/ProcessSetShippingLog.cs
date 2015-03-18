using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessSetShippingLog : IBusinessLogic
    {
        private ShippingLog m_ShippingLog;

        public ProcessSetShippingLog()
        {
        }

        public void Invoke()
        {
            SetShippingLog setShippingLog = new SetShippingLog();
            setShippingLog.ShippingLog = this.m_ShippingLog;
            setShippingLog.Update();
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }
}

