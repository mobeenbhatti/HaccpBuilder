using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenCCPGroup : IBusinessLogic
    {
        private KitchenCCPGroup m_KitchenCCPGroup;

        public ProcessCreateKitchenCCPGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenCCPGroup createkitchenCCPGroup = new CreateKitchenCCPGroup();
            createkitchenCCPGroup.KitchenCCPGroup = this.m_KitchenCCPGroup;
            createkitchenCCPGroup.Insert();
            this.m_KitchenCCPGroup = createkitchenCCPGroup.KitchenCCPGroup;
        }

        public KitchenCCPGroup kitchenCCPGroup
        {
            get { return m_KitchenCCPGroup; }
            set { m_KitchenCCPGroup = value; }
        }
    }
}
