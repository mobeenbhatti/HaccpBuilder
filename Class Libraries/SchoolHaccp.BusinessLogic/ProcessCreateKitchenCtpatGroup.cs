using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenCtpatGroup : IBusinessLogic
    {
        private KitchenCtpatGroup m_KitchenCtpatGroup;

        public ProcessCreateKitchenCtpatGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenCtpatGroup createkitchenCtpatGroup = new CreateKitchenCtpatGroup();
            createkitchenCtpatGroup.KitchenCtpatGroup = this.m_KitchenCtpatGroup;
            createkitchenCtpatGroup.Insert();
            this.m_KitchenCtpatGroup = createkitchenCtpatGroup.KitchenCtpatGroup;
        }

        public KitchenCtpatGroup KitchenCtpatGroup
        {
            get { return m_KitchenCtpatGroup; }
            set { m_KitchenCtpatGroup = value; }
        }
    }
}
