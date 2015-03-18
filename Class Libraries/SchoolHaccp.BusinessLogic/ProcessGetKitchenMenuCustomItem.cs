using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessGetKitchenMenuCustomItem : IBusinessLogic
    {
        private IDataReader m_ResultSet;
        private KitchenMenuCustomItem m_KitchenMenuCustomItem;

        public ProcessGetKitchenMenuCustomItem()
        {
        }

        public void Invoke()
        {
            GetKitchenMenuCustomItem getCustomInventory = new GetKitchenMenuCustomItem();
            getCustomInventory.KitchenMenuCustomItem = this.KitchenMenuCustomItem;
            this.ResultSet = getCustomInventory.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }


        public KitchenMenuCustomItem KitchenMenuCustomItem
        {
            get { return m_KitchenMenuCustomItem; }
            set { m_KitchenMenuCustomItem = value; }
        }
    }
}
