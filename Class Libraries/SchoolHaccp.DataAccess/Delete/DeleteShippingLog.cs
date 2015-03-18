using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Delete
{
    public class DeleteShippingLog : DataAccessBase
    {
        private ShippingLog m_ShippingLog;

        public DeleteShippingLog()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_DeleteShippingLog.ToString();
        }

        public void Delete()
        {
            DeleteShippingLogDataParameters createParameters = new DeleteShippingLogDataParameters(this.m_ShippingLog);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }
    }

    public class DeleteShippingLogDataParameters
    {
        private ShippingLog m_ShippingLog;
        object[] m_Parameters;

        public DeleteShippingLogDataParameters(ShippingLog ShippingLog)
        {
            this.m_ShippingLog = ShippingLog;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[1];
            parameters[0] = this.m_ShippingLog.ShippingLogId;
            Parameters = parameters;
        }

        public ShippingLog ShippingLog
        {
            get { return m_ShippingLog; }
            set { m_ShippingLog = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
