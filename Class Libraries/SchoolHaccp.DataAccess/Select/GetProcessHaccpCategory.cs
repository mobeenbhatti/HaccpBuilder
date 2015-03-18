using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace SchoolHaccp.DataAccess.Select
{
    public class GetProcessHaccpCategory
    {
        public DataSet GetHaccpCategoryHeaderByProcessId(int nProcessId)
        {
            object[] parameters = new object[1];
            parameters[0] = nProcessId;


            DataServices ds = new DataServices();
            return ds.ExecuteDataSet("uspAdm_GetProcessHaccpCategoryHeaderByProcessId", parameters);
        }
    }
}
