using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteMobile : IBusinessLogic
    {
       
        public ProcessDeleteMobile()
        {
        }
        public void Invoke()
        {

        }

        public void Invoke(int nMobileId)
        {
            DeleteMobile deleteMobile = new DeleteMobile();
            deleteMobile.Delete(nMobileId);
        }

        public void DeleteMobileChecklist(int MobileId)
        {
            DeleteMobile deleteMobile = new DeleteMobile();
            deleteMobile.DeleteMobileChecklist(MobileId);
        }


    }
}

