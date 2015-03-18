using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
   public class ProcessDeleteDistrict
    {      
         public ProcessDeleteDistrict()
        {
        }
        public void Invoke()
        {
            
        }

        public void Invoke(int nDistrictId)
        {
            DeleteDistrict deleteKitchen = new DeleteDistrict();
            deleteKitchen.Delete(nDistrictId);
        }
    }
}
