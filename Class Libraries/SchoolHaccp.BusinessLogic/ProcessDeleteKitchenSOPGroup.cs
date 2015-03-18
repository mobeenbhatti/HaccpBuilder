using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenSOPGroup : IBusinessLogic
    {
        private KitchenSOPGroup m_KitchenSOPGroup;

        public ProcessDeleteKitchenSOPGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenSOPGroup deleteKitchenSOPGroup = new DeleteKitchenSOPGroup();
            deleteKitchenSOPGroup.KitchenSOPGroup = this.m_KitchenSOPGroup;
            deleteKitchenSOPGroup.Delete();
        }


        public KitchenSOPGroup KitchenSOPGroup
        {
            get { return m_KitchenSOPGroup; }
            set { m_KitchenSOPGroup = value; }
        }
    }
}

