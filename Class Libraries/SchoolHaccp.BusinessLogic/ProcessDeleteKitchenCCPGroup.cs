using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenCCPGroup : IBusinessLogic
    {
        private KitchenCCPGroup m_KitchenCCPGroup;

        public ProcessDeleteKitchenCCPGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenCCPGroup deleteKitchenCCPGroup = new DeleteKitchenCCPGroup();
            deleteKitchenCCPGroup.KitchenCCPGroup = this.m_KitchenCCPGroup;
            deleteKitchenCCPGroup.Delete();
        }


        public KitchenCCPGroup KitchenCCPGroup
        {
            get { return m_KitchenCCPGroup; }
            set { m_KitchenCCPGroup = value; }
        }
    }
}
