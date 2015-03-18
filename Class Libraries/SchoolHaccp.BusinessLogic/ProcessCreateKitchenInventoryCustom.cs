using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessCreateKitchenInventoryCustom : IBusinessLogic
    {
        private KitchenInventoryCustom m_KitchenInventoryCustom;

        public ProcessCreateKitchenInventoryCustom()
        {
        }

        public void Invoke()
        {
            CreateKitchenInventoryCustom createCustomIventory = new CreateKitchenInventoryCustom();
            createCustomIventory.KitchenInventoryCustom = this.m_KitchenInventoryCustom;
            createCustomIventory.Insert();
            this.m_KitchenInventoryCustom = createCustomIventory.KitchenInventoryCustom;
        }        
        public void Invoke(string strMode)
        {
            CreateKitchenInventoryCustom createCustomIventory = new CreateKitchenInventoryCustom();
            createCustomIventory.KitchenInventoryCustom = this.m_KitchenInventoryCustom;
            createCustomIventory.Insert("php");            
        }

        public KitchenInventoryCustom KitchenInventoryCustom
        {
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
        }
    }
}
