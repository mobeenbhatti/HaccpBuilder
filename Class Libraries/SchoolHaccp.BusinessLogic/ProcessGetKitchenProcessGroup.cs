using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{

    public class ProcessGetKitchenProcessGroup : IBusinessLogic
    {
        private IDataReader m_DataSet;

        public ProcessGetKitchenProcessGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nKitchenId)
        {
            GetKitchenProcessGroup KitchenProcessGroup = new GetKitchenProcessGroup();
            this.ResultSet = KitchenProcessGroup.Get(nKitchenId);
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