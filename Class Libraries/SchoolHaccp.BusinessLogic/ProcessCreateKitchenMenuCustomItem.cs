using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenMenuCustomItem : IBusinessLogic
    {
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

        public ProcessCreateKitchenMenuCustomItem()
        {
        }

        public void Invoke()
        {
            CreateKitchenMenuCustomItem createCustomIventory = new CreateKitchenMenuCustomItem();
            createCustomIventory.KitchenMenuCustomItem = this.m_KitchenMenuCustomItem;
            createCustomIventory.Insert();
            this.m_KitchenMenuCustomItem = createCustomIventory.KitchenMenuCustomItem;
        }
        public void Invoke(string strMode)
        {
            CreateKitchenMenuCustomItem createCustomIventory = new CreateKitchenMenuCustomItem();
            createCustomIventory.KitchenMenuCustomItem = this.m_KitchenMenuCustomItem;
            createCustomIventory.Insert("php");            
        }

        public KitchenMenuCustomItem KitchenMenuCustomItem
        {
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
        }
    }
}
