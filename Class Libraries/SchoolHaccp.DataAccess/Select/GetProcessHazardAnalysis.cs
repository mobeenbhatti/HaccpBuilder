using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
   public class GetProcessHazardAnalysis : DataAccessBase
    {
        public GetProcessHazardAnalysis()
        {
            
        }
        public DataSet GetHazardAnalysisHeaderByProcessId(int nProcessId)
        {
            object[] parameters = new object[1];
            parameters[0] = nProcessId;


            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetProcessHazardAnalysisHeaderByProcessId", parameters);
        }
    }
}
