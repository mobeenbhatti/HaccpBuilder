using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
  public class SetProcessHazardAnalysis
    {
      public void SetProcessHazardAnalysisStatus(int nProcessId, int nActive)
      {
          object[] parameters = new object[2];
          parameters[0] = nProcessId;
          parameters[1] = nActive;
          DataServices dataServices = new DataServices();
          dataServices.ExecuteNonQuery("uspAdm_UpdateProcessHazardAnalysisStatusByProcessId", parameters);
      }
    }
}
