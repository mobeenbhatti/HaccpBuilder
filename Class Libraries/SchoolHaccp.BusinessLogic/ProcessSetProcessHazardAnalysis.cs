using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetProcessHazardAnalysis
    {
       public void SetProcessHazardAnalysisStatus(int nProcessId,int nActive)
       {
           SetProcessHazardAnalysis setHazardAnalysis = new SetProcessHazardAnalysis();
           setHazardAnalysis.SetProcessHazardAnalysisStatus(nProcessId,nActive);
       }
    }
}
