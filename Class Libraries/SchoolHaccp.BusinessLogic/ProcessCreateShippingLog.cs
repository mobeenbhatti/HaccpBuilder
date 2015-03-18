
using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateShippingLog : IBusinessLogic
    {
        private ShippingLog m_ShippingLog;

        public ProcessCreateShippingLog()
        {
        }

        public void Invoke()
        {
            CreateShippingLog createShippingLog = new CreateShippingLog();
            createShippingLog.ShippingLog = this.m_ShippingLog;
            createShippingLog.Insert();
            this.m_ShippingLog = createShippingLog.ShippingLog;
        }
        public void Invoke(string strMode)
        {
            CreateShippingLog createShippingLog = new CreateShippingLog();
            createShippingLog.ShippingLog = this.m_ShippingLog;
            createShippingLog.Insert("php");
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }
}