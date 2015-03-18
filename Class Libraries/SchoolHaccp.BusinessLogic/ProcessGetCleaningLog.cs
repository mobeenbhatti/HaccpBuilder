using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
namespace SchoolHaccp.BusinessLogic
{
  [System.ComponentModel.DataObject]
  public  class ProcessGetCleaningLog
    {
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCleaningLogDataSet(int nKitchenId)
        {
            GetCleaningLog log = new GetCleaningLog();
            return log.GetCleaningLogDataSet(nKitchenId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCleaningLogDataSetByMobileId(int nKitchenId,int nMobileId)
        {
            GetCleaningLog log = new GetCleaningLog();
            return log.GetCleaningLogDataSetByMobileId(nKitchenId,nMobileId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetCleaningLogInventory(int nKitchenId)
        {
            GetCleaningLog log = new GetCleaningLog();
            return log.GetCleaningLogInventory(nKitchenId);
        }
    }
}
