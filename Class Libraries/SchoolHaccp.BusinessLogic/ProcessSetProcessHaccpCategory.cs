using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessSetProcessHaccpCategory
    {
        public void SetProcessHaccpCategoryStatus(int nProcessId, int nActive)
        {
            SetProcessHaccpCategory setHaccpCategory = new SetProcessHaccpCategory();
            setHaccpCategory.SetProcessHaccpCategoryStatus(nProcessId, nActive);
        }
    }
}
