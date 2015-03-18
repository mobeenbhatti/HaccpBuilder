using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
namespace SchoolHaccp.BusinessLogic
{
   public class ProcessGetKitchenCheckListAddOnGroup
    {
         private IDataReader m_DataSet;

         public ProcessGetKitchenCheckListAddOnGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nKitchenId)
        {
            GetKitchenCheckListAddOnGroup KitchenCheckListGroup = new GetKitchenCheckListAddOnGroup();
            this.ResultSet = KitchenCheckListGroup.Get(nKitchenId);
        }
        public IDataReader ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        
        public IDataReader Get(int nKitchenId)
        {
            this.Invoke(nKitchenId);
            return this.ResultSet;

        }        
    }
}
