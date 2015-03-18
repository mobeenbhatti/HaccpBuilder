using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessGetKitchenInventoryCustom : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private KitchenInventoryCustom m_KitchenInventoryCustom;

        public ProcessGetKitchenInventoryCustom()
        {
        }

        public void Invoke()
        {
            GetKitchenInventoryCustom getCustomInventory = new GetKitchenInventoryCustom();
            getCustomInventory.KitchenInventoryCustom = this.KitchenInventoryCustom;
            this.ResultSet = getCustomInventory.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }


        public KitchenInventoryCustom KitchenInventoryCustom
        {
            get { return m_KitchenInventoryCustom; }
            set { m_KitchenInventoryCustom = value; }
        }
    }
}
