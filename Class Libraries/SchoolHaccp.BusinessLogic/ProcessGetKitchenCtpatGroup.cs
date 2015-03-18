using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
namespace SchoolHaccp.BusinessLogic
{
    public class ProcessGetKitchenCtpatGroup : IBusinessLogic
    {
        private IDataReader m_DataSet;

        public ProcessGetKitchenCtpatGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nKitchenId)
        {
            GetKitchenCtpatGroup KitchenCtpatGroup = new GetKitchenCtpatGroup();
            this.ResultSet = KitchenCtpatGroup.Get(nKitchenId);
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
