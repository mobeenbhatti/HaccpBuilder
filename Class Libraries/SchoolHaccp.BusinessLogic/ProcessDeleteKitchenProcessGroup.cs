using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenProcessGroup : IBusinessLogic
    {
        private KitchenProcessGroup m_KitchenProcessGroup;

        public ProcessDeleteKitchenProcessGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenProcessGroup deleteKitchenProcessGroup = new DeleteKitchenProcessGroup();
            deleteKitchenProcessGroup.KitchenProcessGroup = this.m_KitchenProcessGroup;
            deleteKitchenProcessGroup.Delete();
        }


        public KitchenProcessGroup KitchenProcessGroup
        {
            get { return m_KitchenProcessGroup; }
            set { m_KitchenProcessGroup = value; }
        }
    }
}
