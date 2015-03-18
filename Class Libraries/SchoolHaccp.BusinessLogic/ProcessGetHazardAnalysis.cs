using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;
namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessGetHazardAnalysis: IBusinessLogic
    {
        public void Invoke()
        {

        }
        public DataSet GetHazardAnalysisHeaderByProcessId(int nProcessId)
        {
            GetProcessHazardAnalysis Process = new GetProcessHazardAnalysis();
            return Process.GetHazardAnalysisHeaderByProcessId(nProcessId);
        }
    }
}
