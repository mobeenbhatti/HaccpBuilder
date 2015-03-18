using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
namespace SchoolHaccp.BusinessLogic
{
   [System.ComponentModel.DataObject]
   public class ProcessGetPestLog
    {
       [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
       public DataSet GetPestLogDataSet(int nKitchenId)
       {
           GetPestLog log = new GetPestLog();
           return log.GetPestLogDataSet(nKitchenId);
       }
       [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
       public DataSet GetPestLogDataSetByMobileId(int nKitchenId,int nMobileId)
       {
           GetPestLog log = new GetPestLog();
           return log.GetPestLogDataSetByMobileId(nKitchenId,nMobileId);
       }
       [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
       public DataSet GetPestLogInventory(int nKitchenId)
       {
           GetPestLog log = new GetPestLog();
           return log.GetPestLogInventory(nKitchenId);
       }
    }
}
