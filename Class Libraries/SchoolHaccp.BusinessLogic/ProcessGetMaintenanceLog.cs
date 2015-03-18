using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
   public class ProcessGetMaintenanceLog
    {
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMaintenanceLogDataSet(int nKitchenId)
        {
            GetMaintenanceLog log = new GetMaintenanceLog();
            return log.GetMaintenanceLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetMaintenanceLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            GetMaintenanceLog log = new GetMaintenanceLog();
            return log.GetMaintenanceLogDataSetByMobileId(nKitchenId,nMobileId);
        }
    }
}
