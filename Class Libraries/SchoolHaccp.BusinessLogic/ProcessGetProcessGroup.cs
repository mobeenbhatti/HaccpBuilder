using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetProcessGroup : IBusinessLogic
    {
        private DataSet m_DataSet;

        public ProcessGetProcessGroup()
        {
        }

        public void Invoke()
        {

        }
        public void Invoke(int nDistrictId)
        {
            GetProcessGroup ProcessGroup = new GetProcessGroup();
            this.ResultSet = ProcessGroup.Get(nDistrictId);
        }
        public DataSet ResultSet
        {
            get { return m_DataSet; }
            set { m_DataSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet Get(int nDistrictId)
        {
            this.Invoke(nDistrictId);
            return this.ResultSet;

        }
        public DataSet GetProcessGroupByName(int nDistrictId, string strGroupName)
        {
            GetProcessGroup ProcessGroup = new GetProcessGroup();
            this.ResultSet = ProcessGroup.GetProcessGroupByName(nDistrictId, strGroupName);
            return this.ResultSet;

        }
    }


}
