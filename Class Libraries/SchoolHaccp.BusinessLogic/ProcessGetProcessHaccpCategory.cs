using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
  public  class ProcessGetProcessHaccpCategory
    {
        public DataSet GetHaccpCategoryHeaderByProcessId(int nProcessId)
        {
            GetProcessHaccpCategory Process = new GetProcessHaccpCategory();
            return Process.GetHaccpCategoryHeaderByProcessId(nProcessId);
        }
    }
}
