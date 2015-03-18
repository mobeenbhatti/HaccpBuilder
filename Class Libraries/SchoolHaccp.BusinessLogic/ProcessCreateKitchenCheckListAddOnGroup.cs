using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;
namespace SchoolHaccp.BusinessLogic
{
  public class ProcessCreateKitchenCheckListAddOnGroup
    {
        private KitchenCheckListAddOnGroup m_KitchenCheckListGroup;

        public ProcessCreateKitchenCheckListAddOnGroup()
        {
        }

        public void Invoke()
        {
            CreateKitchenCheckListAddonGroup createkitchenCheckListGroup = new CreateKitchenCheckListAddonGroup();
            createkitchenCheckListGroup.KitchenCheckListGroup = this.m_KitchenCheckListGroup;
            createkitchenCheckListGroup.Insert();
            this.m_KitchenCheckListGroup = createkitchenCheckListGroup.KitchenCheckListGroup;
        }

        public KitchenCheckListAddOnGroup KitchenCheckListGroup
        {
            get { return m_KitchenCheckListGroup; }
            set { m_KitchenCheckListGroup = value; }
        }
    }
}
