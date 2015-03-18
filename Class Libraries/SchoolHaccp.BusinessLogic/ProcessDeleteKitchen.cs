using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchen : IBusinessLogic
    {
        private KitchenCheckListGroup m_KitchenCheckListGroup;

        public ProcessDeleteKitchen()
        {
        }
        public void Invoke()
        {
            
        }

        public void Invoke(int nKitchenId)
        {
            DeleteKitchen deleteKitchen = new DeleteKitchen();
            deleteKitchen.Delete(nKitchenId);
        }

        
    }
}

