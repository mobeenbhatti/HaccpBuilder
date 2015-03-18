using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessKitchenValidationGroup : IBusinessLogic
    {
        private KitchenValidationGroup m_KitchenValidationGroup;

        public ProcessKitchenValidationGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenValidationGroup createkitchenValidationGroup = new CreateKitchenValidationGroup();
            createkitchenValidationGroup.KitchenValidationGroup = this.m_KitchenValidationGroup;
            createkitchenValidationGroup.Insert();
            this.m_KitchenValidationGroup = createkitchenValidationGroup.KitchenValidationGroup;
        }

        public KitchenValidationGroup kitchenValidationGroup
        {
            get { return m_KitchenValidationGroup; }
            set { m_KitchenValidationGroup = value; }
        }
    }
}

