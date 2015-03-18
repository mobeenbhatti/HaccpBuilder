using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenValidationGroup : IBusinessLogic
    {
        private KitchenValidationGroup m_KitchenValidationGroup;

        public ProcessDeleteKitchenValidationGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenValidationGroup deleteKitchenValidationGroup = new DeleteKitchenValidationGroup();
            deleteKitchenValidationGroup.KitchenValidationGroup = this.m_KitchenValidationGroup;
            deleteKitchenValidationGroup.Delete();
        }


        public KitchenValidationGroup KitchenValidationGroup
        {
            get { return m_KitchenValidationGroup; }
            set { m_KitchenValidationGroup = value; }
        }
    }
}

