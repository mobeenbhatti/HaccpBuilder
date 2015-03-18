using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenSOPGroup : IBusinessLogic
    {
        private KitchenSOPGroup m_KitchenSOPGroup;

        public ProcessCreateKitchenSOPGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenSOPGroup createkitchenSOPGroup = new CreateKitchenSOPGroup();
            createkitchenSOPGroup.KitchenSOPGroup = this.m_KitchenSOPGroup;
            createkitchenSOPGroup.Insert();
            this.m_KitchenSOPGroup = createkitchenSOPGroup.KitchenSOPGroup;
        }

        public KitchenSOPGroup kitchenSOPGroup
        {
            get { return m_KitchenSOPGroup; }
            set { m_KitchenSOPGroup = value; }
        }
    }
}
